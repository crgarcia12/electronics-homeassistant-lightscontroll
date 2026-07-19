[CmdletBinding()]
param(
    [string]$Port = "COM3",
    [string]$IdfPath,
    [string]$ConfigPath,
    [string]$SecretsPath,
    [string]$ExpectedMac,
    [string]$WifiSsid,
    [string]$MqttUri,
    [string]$MqttUsername,
    [string]$DeviceName,
    [string]$RoomName,
    [string]$OtaUrl,
    [switch]$ValidateOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$mqttUsernameProvided = $PSBoundParameters.ContainsKey("MqttUsername")
$otaUrlProvided = $PSBoundParameters.ContainsKey("OtaUrl")
$defaultWifiSsid = "gugelmatt-iot"
$defaultMqttUri = "mqtt://gugelmatt-ha.home.arpa:1883"
$defaultMqttUsername = "lightcontrol"

function Read-RequiredValue {
    param(
        [string]$Prompt,
        [string]$Value
    )

    while ([string]::IsNullOrWhiteSpace($Value)) {
        $Value = Read-Host $Prompt
    }
    return $Value
}

function ConvertFrom-SecureStringValue {
    param([Security.SecureString]$Value)

    $pointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($Value)
    try {
        return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($pointer)
    }
    finally {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($pointer)
    }
}

function Assert-Utf8Length {
    param(
        [string]$Name,
        [string]$Value,
        [int]$MaximumBytes
    )

    $length = [Text.Encoding]::UTF8.GetByteCount($Value)
    if ($length -gt $MaximumBytes) {
        throw "$Name is $length bytes; the firmware limit is $MaximumBytes bytes."
    }
}

function Get-JsonValue {
    param(
        [object]$Object,
        [string]$Name
    )

    if ($null -eq $Object) {
        return $null
    }
    $property = $Object.PSObject.Properties[$Name]
    if ($null -eq $property -or $null -eq $property.Value) {
        return $null
    }
    return [string]$property.Value
}

function Get-JsonMapValue {
    param(
        [object]$Object,
        [string]$MapName,
        [string]$Key
    )

    if ($null -eq $Object -or [string]::IsNullOrEmpty($Key)) {
        return $null
    }
    $mapProperty = $Object.PSObject.Properties[$MapName]
    if ($null -eq $mapProperty -or $null -eq $mapProperty.Value) {
        return $null
    }
    return Get-JsonValue $mapProperty.Value $Key
}

function Normalize-MacAddress {
    param([string]$MacAddress)

    $hex = $MacAddress -replace "[^0-9A-Fa-f]", ""
    if ($hex.Length -ne 12) {
        throw "Invalid MAC address '$MacAddress'."
    }

    $parts = for ($offset = 0; $offset -lt 12; $offset += 2) {
        $hex.Substring($offset, 2).ToUpperInvariant()
    }
    return $parts -join ":"
}

function Find-IdfPython {
    if (-not [string]::IsNullOrWhiteSpace($env:IDF_PYTHON_ENV_PATH)) {
        $activePython = Join-Path $env:IDF_PYTHON_ENV_PATH "Scripts\python.exe"
        if (Test-Path -LiteralPath $activePython -PathType Leaf) {
            return $activePython
        }
    }

    $pythonEnvironments = Join-Path $HOME ".espressif\python_env"
    if (Test-Path -LiteralPath $pythonEnvironments -PathType Container) {
        $candidate = Get-ChildItem -LiteralPath $pythonEnvironments -Directory |
            Sort-Object LastWriteTime -Descending |
            ForEach-Object { Join-Path $_.FullName "Scripts\python.exe" } |
            Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } |
            Select-Object -First 1
        if ($candidate) {
            return $candidate
        }
    }

    throw "ESP-IDF Python was not found. Install ESP-IDF or run its export script first."
}

function Read-ConnectedMacAddress {
    param(
        [string]$Python,
        [string]$SerialPort
    )

    $output = & $Python -m esptool --chip esp32s3 -p $SerialPort --before default_reset --after no_reset read_mac 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to read the connected ESP32 MAC address.`n$($output -join [Environment]::NewLine)"
    }

    $match = [regex]::Match(
        $output -join [Environment]::NewLine,
        "(?im)^MAC:\s*([0-9a-f]{2}(?::[0-9a-f]{2}){5})\s*$"
    )
    if (-not $match.Success) {
        throw "esptool did not return the connected ESP32 MAC address."
    }
    return Normalize-MacAddress $match.Groups[1].Value
}

$temporaryDirectory = $null
$wifiPassword = $null
$mqttPassword = $null

try {
    if ([string]::IsNullOrWhiteSpace($IdfPath)) {
        $IdfPath = $env:IDF_PATH
    }
    if ([string]::IsNullOrWhiteSpace($IdfPath)) {
        $defaultIdfPath = Join-Path $HOME "esp\esp-idf"
        if (Test-Path -LiteralPath $defaultIdfPath -PathType Container) {
            $IdfPath = $defaultIdfPath
        }
    }
    if ([string]::IsNullOrWhiteSpace($IdfPath)) {
        throw "ESP-IDF was not found. Pass its location with -IdfPath."
    }

    $nvsGenerator = Join-Path $IdfPath "components\nvs_flash\nvs_partition_generator\nvs_partition_gen.py"
    if (-not (Test-Path -LiteralPath $nvsGenerator -PathType Leaf)) {
        throw "NVS generator not found under ESP-IDF path '$IdfPath'."
    }

    if (-not [string]::IsNullOrWhiteSpace($ConfigPath)) {
        $ConfigPath = (Resolve-Path -LiteralPath $ConfigPath).Path
        $deviceConfig = Get-Content -LiteralPath $ConfigPath -Raw | ConvertFrom-Json
        foreach ($passwordProperty in @("wifiPassword", "mqttPassword")) {
            if ($deviceConfig.PSObject.Properties[$passwordProperty]) {
                throw "'$passwordProperty' must not be stored in tracked device configuration '$ConfigPath'."
            }
        }

        if ([string]::IsNullOrWhiteSpace($ExpectedMac)) {
            $ExpectedMac = Get-JsonValue $deviceConfig "expectedMac"
        }
        if ([string]::IsNullOrWhiteSpace($WifiSsid)) {
            $WifiSsid = Get-JsonValue $deviceConfig "wifiSsid"
        }
        if ([string]::IsNullOrWhiteSpace($MqttUri)) {
            $MqttUri = Get-JsonValue $deviceConfig "mqttUri"
        }
        if (-not $mqttUsernameProvided) {
            $configuredMqttUsername = Get-JsonValue $deviceConfig "mqttUsername"
            if ($null -ne $configuredMqttUsername) {
                $MqttUsername = $configuredMqttUsername
                $mqttUsernameProvided = $true
            }
        }
        if ([string]::IsNullOrWhiteSpace($DeviceName)) {
            $DeviceName = Get-JsonValue $deviceConfig "deviceName"
        }
        if ([string]::IsNullOrWhiteSpace($RoomName)) {
            $RoomName = Get-JsonValue $deviceConfig "roomName"
        }
        if (-not $otaUrlProvided) {
            $configuredOtaUrl = Get-JsonValue $deviceConfig "otaUrl"
            if ($null -ne $configuredOtaUrl) {
                $OtaUrl = $configuredOtaUrl
                $otaUrlProvided = $true
            }
        }
    }

    if ([string]::IsNullOrWhiteSpace($WifiSsid)) {
        $WifiSsid = $defaultWifiSsid
    }
    if ([string]::IsNullOrWhiteSpace($MqttUri)) {
        $MqttUri = $defaultMqttUri
    }
    if (-not $mqttUsernameProvided) {
        $MqttUsername = $defaultMqttUsername
        $mqttUsernameProvided = $true
    }

    if ([string]::IsNullOrWhiteSpace($SecretsPath)) {
        $SecretsPath = Join-Path $PSScriptRoot "provisioning\secrets.local.json"
    }
    if (Test-Path -LiteralPath $SecretsPath -PathType Leaf) {
        $SecretsPath = (Resolve-Path -LiteralPath $SecretsPath).Path
        $secrets = Get-Content -LiteralPath $SecretsPath -Raw | ConvertFrom-Json
        $wifiPassword = Get-JsonMapValue $secrets "wifiPasswords" $WifiSsid
        if ($null -eq $wifiPassword) {
            $wifiPassword = Get-JsonValue $secrets "wifiPassword"
        }
        $mqttPassword = Get-JsonMapValue $secrets "mqttPasswords" $MqttUsername
        if ($null -eq $mqttPassword) {
            $mqttPassword = Get-JsonValue $secrets "mqttPassword"
        }
        if ($wifiPassword -eq "replace-me") {
            $wifiPassword = $null
        }
        if ($mqttPassword -eq "replace-me") {
            $mqttPassword = $null
        }
    }

    $WifiSsid = Read-RequiredValue "Wi-Fi SSID" $WifiSsid
    if ($null -eq $wifiPassword) {
        $wifiPassword = ConvertFrom-SecureStringValue (Read-Host "Wi-Fi password" -AsSecureString)
    }
    $MqttUri = Read-RequiredValue "MQTT broker URI (for example mqtt://192.168.1.20:1883)" $MqttUri
    if (-not $mqttUsernameProvided) {
        $MqttUsername = Read-Host "MQTT username (leave blank for anonymous access)"
        $mqttUsernameProvided = $true
    }
    if ($null -eq $mqttPassword) {
        $mqttPassword = ConvertFrom-SecureStringValue (Read-Host "MQTT password (leave blank for anonymous access)" -AsSecureString)
    }
    $DeviceName = Read-RequiredValue "Unique device name (for example Kitchen Lighting Controller 1)" $DeviceName
    $RoomName = Read-RequiredValue "Room name (for example Kitchen)" $RoomName
    if (-not $otaUrlProvided) {
        $OtaUrl = ""
    }

    if ($MqttUri -notmatch "^mqtts?://") {
        throw "MQTT URI must start with mqtt:// or mqtts://."
    }
    if (-not [string]::IsNullOrEmpty($OtaUrl) -and $OtaUrl -notmatch "^https://") {
        throw "OTA URL must be empty or start with https://."
    }

    Assert-Utf8Length "Wi-Fi SSID" $WifiSsid 32
    Assert-Utf8Length "Wi-Fi password" $wifiPassword 63
    Assert-Utf8Length "MQTT URI" $MqttUri 127
    Assert-Utf8Length "MQTT username" $MqttUsername 63
    Assert-Utf8Length "MQTT password" $mqttPassword 63
    Assert-Utf8Length "Device name" $DeviceName 47
    Assert-Utf8Length "Room name" $RoomName 47
    Assert-Utf8Length "OTA URL" $OtaUrl 191
    if (-not [string]::IsNullOrWhiteSpace($ExpectedMac)) {
        $ExpectedMac = Normalize-MacAddress $ExpectedMac
    }

    Write-Host ""
    if ($ConfigPath) {
        Write-Host "Config:      $ConfigPath"
    }
    Write-Host "Port:        $Port"
    if ($ExpectedMac) {
        Write-Host "Expected MAC: $ExpectedMac"
    }
    Write-Host "Wi-Fi SSID: $WifiSsid"
    Write-Host "MQTT broker: $MqttUri"
    Write-Host "MQTT user:   $MqttUsername"
    Write-Host "Device:      $DeviceName"
    Write-Host "Room:        $RoomName"
    if ($ValidateOnly) {
        Write-Host "Configuration is valid."
        return
    }

    $confirmation = Read-Host "Flash this configuration? [Y/n]"
    if ($confirmation -and $confirmation -notin @("y", "yes")) {
        Write-Host "Provisioning cancelled."
        return
    }

    $python = Find-IdfPython
    $connectedMac = Read-ConnectedMacAddress $python $Port
    Write-Host "Connected MAC: $connectedMac"
    if ($ExpectedMac -and $connectedMac -ne $ExpectedMac) {
        throw "Connected ESP32 MAC $connectedMac does not match configuration MAC $ExpectedMac."
    }

    $temporaryDirectory = Join-Path ([IO.Path]::GetTempPath()) ("lightcontrol-provision-" + [Guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $temporaryDirectory | Out-Null
    $csvPath = Join-Path $temporaryDirectory "config.csv"
    $nvsPath = Join-Path $temporaryDirectory "nvs.bin"

    $rows = @(
        [pscustomobject][ordered]@{ key = "cfg";        type = "namespace"; encoding = "";       value = "" }
        [pscustomobject][ordered]@{ key = "wifi_ssid";  type = "data";      encoding = "string"; value = $WifiSsid }
        [pscustomobject][ordered]@{ key = "wifi_pwd";   type = "data";      encoding = "string"; value = $wifiPassword }
        [pscustomobject][ordered]@{ key = "mqtt_uri";   type = "data";      encoding = "string"; value = $MqttUri }
        [pscustomobject][ordered]@{ key = "mqtt_user";  type = "data";      encoding = "string"; value = $MqttUsername }
        [pscustomobject][ordered]@{ key = "mqtt_pwd";   type = "data";      encoding = "string"; value = $mqttPassword }
        [pscustomobject][ordered]@{ key = "dev_name";   type = "data";      encoding = "string"; value = $DeviceName }
        [pscustomobject][ordered]@{ key = "room_name";  type = "data";      encoding = "string"; value = $RoomName }
        [pscustomobject][ordered]@{ key = "ota_url";    type = "data";      encoding = "string"; value = $OtaUrl }
        [pscustomobject][ordered]@{ key = "configured"; type = "data";      encoding = "u8";     value = "1" }
    )
    $csvLines = $rows | ConvertTo-Csv -NoTypeInformation
    [IO.File]::WriteAllLines($csvPath, $csvLines, [Text.UTF8Encoding]::new($false))

    & $python $nvsGenerator generate --version 2 $csvPath $nvsPath 0x6000
    if ($LASTEXITCODE -ne 0) {
        throw "NVS image generation failed."
    }
    if ((Get-Item -LiteralPath $nvsPath).Length -ne 0x6000) {
        throw "Generated NVS image has an unexpected size."
    }

    & $python -m esptool --chip esp32s3 -p $Port --before default_reset --after hard_reset write_flash 0x9000 $nvsPath
    if ($LASTEXITCODE -ne 0) {
        throw "Flashing the NVS partition failed."
    }

    Write-Host ""
    Write-Host "Provisioning complete. The controller is rebooting with the saved configuration."
}
finally {
    $wifiPassword = $null
    $mqttPassword = $null
    if ($temporaryDirectory -and (Test-Path -LiteralPath $temporaryDirectory)) {
        Remove-Item -LiteralPath $temporaryDirectory -Recurse -Force
    }
}
