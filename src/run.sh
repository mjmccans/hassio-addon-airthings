#!/usr/bin/env bashio
set -e

MQTT_HOST=$(bashio::config 'mqtt_host')
if [[ -z "$MQTT_HOST" || $MQTT_HOST == "null" ]]; then 
    if ! bashio::services.available "mqtt"; then
        bashio::log.error "No internal MQTT service found. Please install the internal Mosquitto MQTT broker integration."
    else
        bashio::log.info "Internal MQTT service found, fetching configuration ..."
        MQTT_HOST=$(bashio::services mqtt "host")
        MQTT_USER=$(bashio::services mqtt "username")
        MQTT_PASSWORD=$(bashio::services mqtt "password")

        bashio::log.info "Starting python script..."
        python3 ./airthings-mqtt.ha.py      \
            --mqtt_host $MQTT_HOST          \
            --mqtt_username $MQTT_USER      \
            --mqtt_password $MQTT_PASSWORD  \
            --config /data/options.json     \
            --addon
    fi
else
    bashio::log.info "Starting python script with external MQTT broker..."
    python3 ./airthings-mqtt.ha.py      \
        --config /data/options.json     \
        --addon
fi
bashio::log.info "Done."