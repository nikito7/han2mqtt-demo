#!/bin/sh

### discovery.sh ###

function get()
{
cat $secrets | grep $1 | awk -F ": " '{ print $2 }'
}

### 

name="EB1"
id="han2mqtt_eb1"
model=han2mqtt
secrets=/config/secrets.yaml

###

mqttpub="mosquitto_pub -h \
$(get mqtt_server) -u \
$(get mqtt_user) -P \
$(get mqtt_pass)"

###

function voltage()
{
#
$mqttpub -t "homeassistant/sensor/${id}/${1}/config" \
-m '{
  "unit_of_measurement": "V",
  "device_class": "voltage",
  "state_class": "measurement",
  "name": "'"${name} ${2}"'",
  "state_topic": "'"han2mqtt/${id}/${1}"'",
  "value_template": "{{ fffggg1 }}",
  "unique_id": "'"${id}_$1"'",
  "device": {
    "identifiers": "'${id}'",
    "model": "'${id}'"
  }
}'
#
}

voltage VolL1 "Voltage L1"

###
##
#
