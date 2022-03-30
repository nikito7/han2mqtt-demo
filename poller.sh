#!/bin/sh

# rtu over tcp

HOST="-m enc -p 9502 10.1.0.37"

# serial

#TTY="/dev/ttyS3"
#stty -F $TTY cs8 9600
#HOST="-b 9600 -p none -m rtu $TTY"

###

function get16bits()
{
/config/apps/modpoll -a 1 -0 -1 \
-r $1 -c $2 -t 3 $HOST \
| grep '^\[' | awk -F ": " '{ print $2 "," }'
}

###

function get32bits()
{
/config/apps/modpoll -a 1 -0 -1 \
-r $1 -c $2 -t 3:int -e $HOST \
| grep '^\[' | awk -F ": " '{ print $2 "," }'
}

###

result=$(get16bits 108 3)

echo $result | sed -e 's/ //g'

##
#
