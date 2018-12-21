#! /bin/sh
if [ -e /dev/ttyUSB0 ]
then
    chmod o+rw /dev/ttyUSB0
fi

if [ -e /dev/ttyUSB1 ]
then
    chmod o+rw /dev/ttyUSB1
fi
if [ -e /dev/ttyUSB2 ]
then
    chmod o+rw /dev/ttyUSB2
fi

exec /usr/bin/perl fhem.pl fhem.cfg
