#!/usr/bin/env bashio
set -e

bashio::log.info "Getting mqtt configuration..."
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

bashio::log.info "Starting python script..."
python3 ./airthings-mqtt.ha.py --host $MQTT_HOST --username $MQTT_USER --password $MQTT_PASSWORD --config /data/options.json

# If the script exits with an error restart the addon.
retVal=$?
if [ $retVal -ne 0 ]; then
    bashio::log.info "Waiting 30 seconds and then restarting addon because python script has exited with an error..."
    sleep 30
    bashio::addons.restart
fi

bashio::log.info "Done."