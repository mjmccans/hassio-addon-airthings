#!/usr/bin/env bashio
set -e

bashio::log.info "Getting mqtt configuration..."
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

bashio::log.info "Starting python script..."
python3 ./airthings-mqtt.ha.py --host $MQTT_HOST --username $MQTT_USER --password $MQTT_PASSWORD --config /data/options.json

bashio::log.info "Done."