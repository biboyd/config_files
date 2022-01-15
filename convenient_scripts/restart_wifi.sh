#!/bin/bash

# reconnect to current wifi network


network=`iwgetid --raw`

echo "Reconnecting to $network"

iwctl station wlan0 disconnect
sleep 3.2
iwctl station wlan0 connect $network
