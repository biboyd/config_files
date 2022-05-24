#!/bin/bash

# reconnect to current wifi network


network=`iwgetid --raw`

echo "Reconnecting to $network"

iwctl station wlan0 disconnect
sleep 3.2
iwctl station wlan0 connect $network
sleep 3.2
newid=`iwgetid --raw`
while [ "$newid" != "$network" ]
do
	iwctl station wlan0 connect $network
	sleep 3.2
	newid=`iwgetid --raw`
done
