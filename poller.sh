#!/bin/sh

### poller.sh ###

. common.sh

###

# rtu over tcp

HOST="-m enc -p 9502 10.1.0.37"

# serial

#TTY="/dev/ttyS3"
#stty -F $TTY cs8 9600
#HOST="-b 9600 -p none -m rtu $TTY"

###


###

function get16bits()
{
/config/apps/modpoll -a 1 -0 -1 \
-r $1 -c $2 -t 3 $HOST \
| grep '^\[' | awk -F ": " '{ print $2 "," }' | sed -e 's/ //g'
}

###

function get32bits()
{
/config/apps/modpoll -a 1 -0 -1 \
-r $1 -c $2 -t 3:int -e $HOST \
| grep '^\[' | awk -F ": " '{ print $2 "," }' | sed -e 's/ //g'
}

###

result=$(get16bits 108 1)

echo $result

$mqttpub -t "han2mqtt/${id}/VolL1" \
-m $result

##
#
