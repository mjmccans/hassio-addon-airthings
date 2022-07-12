## [1.2.0] - 2022-07-12
### NEW
* Firmware version displayed on device details page.

### Fixes
* Changed bluetooth library from bluepy to bleak, a more modern bluetooth library. This change has material
benefits because bleak communicates with the bluetooth adapter via the hosts' dbus service, meaning that
the addon no longer requires host networking and other higher permission (thus increasing the security rating from 3 to 5).

## [1.1.0] - 2022-05-13
### NEW
* Optional configuration of external mqtt broker.

### Fixes
* Reconcile the addon and non-addon code bases to allow easier future development.

## [1.0.2] - 2022-02-13
### New
* New configuration option to retain your sensor values in the MQTT broker.

## [1.0.1] - 2022-04-08
### Fixes
* Updated documentation and added check for Mosquitto MQTT broker addon requirement.


## [1.0.0] - 2022-02-13
### New
* Support for battery and illuminance sensors for Airthings Wave+ devices pulled from upstream.


## [0.0.4] - 2022-02-04
### New
* Add support for long-term statistics.

### Fixes
* Updated logging format to show date and time.


## [0.0.3] - 2021-09-19
### Fixes
* Fix issue with addon not restarting when bluetooth adapter is not available on system reboot.