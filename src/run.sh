#!/usr/bin/env bashio
set -e

if ! bashio::services.available "mqtt"; then
    bashio::log.error "No internal MQTT service found. Please install the internal Mosquitto MQTT broker integration."
else
    bashio::log.info "Internal MQTT service found, fetching configuration ..."
    MQTT_HOST=$(bashio::services mqtt "host")
    MQTT_USER=$(bashio::services mqtt "username")
    MQTT_PASSWORD=$(bashio::services mqtt "password")

    bashio::log.info "Starting python script..."
    python3 ./airthings-mqtt.ha.py --host $MQTT_HOST --username $MQTT_USER --password $MQTT_PASSWORD --config /data/options.json
fi

bashio::log.info "Done."