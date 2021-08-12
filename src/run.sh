#!/usr/bin/env bashio
set -e

bashio::log.info "Getting mqtt configuration..."

MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

echo "MQTT Host: $MQTT_HOST"
echo "MQTT Username: $MQTT_USER"
echo "MQTT Password: $MQTT_PASSWORD"

# see example: https://github.com/home-assistant/addons/edit/master/dhcp_server/data/run.sh
for device in $(bashio::config 'devices|keys'); do
    mac=$(bashio::config "devices[${device}].mac")
    device_name=$(bashio::config "devices[${device}].device_name")
    echo "MAC: $mac"
    echo "Device Name: $device_name"
done