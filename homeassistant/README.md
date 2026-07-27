# Home Assistant setup

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

- MQTT discovery exposes the controller switches, firmware update entities, update-check buttons,
  diagnostics, and sensors.
- The dashboard creates one collapsed Online/Offline summary per discovered controller. Expanding
  it shows every switch, update entity, and sensor belonging to that device. New controllers appear
  automatically.
- The dashboard publishes `UPDATE` to `home/lightcontrol/all/firmware/update`.
- **Check for updates in all controllers** publishes `CHECK` to
  `home/lightcontrol/all/firmware/check`, waking each
  online controller's release task immediately.
- Each device keeps its own `update.lightcontrol_*_firmware` entity for individual updates.
- Identity diagnostics include the configured device name, room, board model, and channel count.

## Dashboard dependency

This dashboard uses two HACS frontend cards:

- `custom:auto-entities` to discover controllers and their entities automatically.
- `custom:expander-card` to keep each controller collapsed until its details are needed.

Install **Auto Entities** and **Expander Card** from **HACS → Frontend**.

## Update flow

1. Press a controller's **Check for updates** button, or
   **Check for updates in all controllers** for the fleet.
2. Use an individual `update.lightcontrol_*_firmware` entity for one controller.
3. Test that controller.
4. Use **Update all controllers** to publish the global MQTT update command.

While an update runs, the update entity reports that installation is in progress and the expanded
controller card's **Firmware status** sensor moves through `scheduled`, `checking release`,
`downloading N%`, and `restarting`. A failure is retained there with its ESP-IDF error.

The RGB LED rapidly blinks purple throughout the update. After installation, the controller reboots,
alternates blue and green while reconnecting, and turns the RGB LED off when WiFi and MQTT are healthy.
The update that first installs this behavior cannot blink purple because the previous firmware performs
that download. The separate active-high status LED on GPIO1 stays off and emits one brief pulse whenever
an MQTT message is published or received.

The global command is not retained, so offline controllers do not unexpectedly update later.
Online controllers wait a random 0-30 seconds before downloading to avoid a download spike.

## Release versions

The firmware release workflow builds `firmware/lightcontrol` with ESP-IDF `v5.3.1`.

Firmware versions are stable numeric `MAJOR.MINOR.PATCH` values without a prefix or suffix:

- `1.0.1`
- `1.0.2`
- `1.0.3`

Push a numeric tag to publish a stable release. You can also run the workflow manually with an
existing numeric tag. Controllers ignore drafts, prereleases, and tags that do not exactly match
the numeric version format.
