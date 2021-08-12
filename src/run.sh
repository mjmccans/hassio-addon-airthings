#!/usr/bin/env bashio
set -e

bashio::log.info "Creating DHCP configuration..."

MQTT_HOST=$(bashio::services mqtt "host")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

echo "MQTT Host: $MQTT_HOST"
echo "MQTT Username: $MQTT_USER"
echo "MQTT Password: $MQTT_PASSWORD"
