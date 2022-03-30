#!/bin/sh

### discovery.sh ###

. common.sh

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
  "value_template": "{{ value }}",
  "unique_id": "'"${id}_$1"'",
  "device": {
    "identifiers": "'${id}'",
    "name":"'"$name"'",
    "model": "cpha.pt"
  }
}'
#
}

voltage VolL1 "Voltage L1"

###
##
#
