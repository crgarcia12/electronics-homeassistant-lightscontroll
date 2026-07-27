# Home Assistant setup

The dashboard publishes the fleet MQTT command directly, so the package is optional. To also
install `script.lightcontrol_update_all` for automations, copy
`homeassistant/packages/lightcontrol.yaml` to `/config/packages/lightcontrol.yaml` and enable
packages in `configuration.yaml`:

```yaml
homeassistant:
  packages: !include_dir_named packages
```

Copy `homeassistant/lightcontrol-dashboard.yaml` to
`/config/lightcontrol-dashboard.yaml`, then add an additional YAML dashboard:

```yaml
lovelace:
  dashboards:
    lightcontrol-dashboard:
      mode: yaml
      title: LightControl
      icon: mdi:home-lightbulb
      show_in_sidebar: true
      filename: lightcontrol-dashboard.yaml
```

Restart Home Assistant after changing `configuration.yaml`.

## What it does

- MQTT discovery exposes the controller switches, firmware update entities, diagnostics, and sensors.
- The dashboard creates one collapsed Online/Offline summary per discovered controller. Expanding
  it shows every switch, update entity, and sensor belonging to that device. New controllers appear
  automatically.
- The dashboard and optional `script.lightcontrol_update_all` publish `UPDATE` to
  `home/lightcontrol/all/firmware/update`.
- Each device keeps its own `update.lightcontrol_*_firmware` entity for individual updates.
- Identity diagnostics include the configured device name, room, board model, and channel count.

## Dashboard dependency

This dashboard uses two HACS frontend cards:

- `custom:auto-entities` to discover controllers and their entities automatically.
- `custom:expander-card` to keep each controller collapsed until its details are needed.

Install **Auto Entities** and **Expander Card** from **HACS → Frontend**.

## Update flow

1. Use an individual `update.lightcontrol_*_firmware` entity for one controller.
2. Test that controller.
3. Use **Update all controllers** to publish the global MQTT update command.

While an update runs, the update entity reports that installation is in progress and the expanded
controller card's **Firmware status** sensor moves through `scheduled`, `checking release`,
`downloading`, and `restarting`. A failure is retained there with its ESP-IDF error.

Firmware with OTA LED indication rapidly blinks the board's status LED purple throughout the update.
After installation, the controller reboots, alternates blue and green while reconnecting, and turns
the LED off when WiFi and MQTT are healthy. The update that first installs this behavior cannot blink
purple because the previous firmware performs that download.

The global command is not retained, so offline controllers do not unexpectedly update later.
Online controllers wait a random 0-30 seconds before downloading to avoid a download spike.

## Release tags

The firmware release workflow builds `firmware/lightcontrol` with ESP-IDF `v5.3.1`.

- `v1.2.3` → stable release
- `v1.2.3-rc1` → prerelease
- `v1.2.3-beta.2` → prerelease
- `v1.2.3-alpha` → prerelease

You can also run the workflow manually with a tag and explicit prerelease flag.
The manual tag must already exist.

Controllers select the newest published release that contains `lightcontrol.bin`, including
prereleases. This supports a pilot flow: publish an `-rc` release, update one controller from its
individual update entity, test it, and then use the fleet button.
