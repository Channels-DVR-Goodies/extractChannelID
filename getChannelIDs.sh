#!/bin/bash

ChannelsDVRHost="dvr.bod.org"
Destination="channelIDs.tsv"

echo "Retrieving guide information from your Channels DVR"
wget --quiet --show-progress --output-document /tmp/guideOnNow.json http://${ChannelsDVRHost}:8089/devices/ANY/guide/now
extractChannelIDs /tmp/guideOnNow.json > "${Destination}"
rm /tmp/guideOnNow.json
echo "Information about channels lineup has been written to \"${Destination}\""
