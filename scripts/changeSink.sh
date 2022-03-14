#!/bin/sh

CURRENT_SINK=`pacmd list-sinks | grep '*' | tr -d '* index: '`
echo $CURRENT_SINK

if [ "$CURRENT_SINK" = "0" ]; then
    `pacmd set-default-sink 1`
fi

if [ "$CURRENT_SINK" = "1" ]; then
    `pacmd set-default-sink 0`
fi
