#!/bin/sh

name="EB1"
id="han2mqtt_eb1"
model=han2mqtt
secrets=/config/secrets.yaml

###

function get()
{
cat $secrets | grep $1 | awk -F ": " '{ print $2 }'
}

###

mqttpub="mosquitto_pub -h \
$(get mqtt_server) -u \
$(get mqtt_user) -P \
$(get mqtt_pass)"

###



#EOF
