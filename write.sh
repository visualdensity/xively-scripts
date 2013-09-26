#!/bin/bash

apiKey=
feedId=

if [ ! -z $1 ];
then
    channel=$1
fi

if [ ! -z $2 ];
then
    value=$2
fi

if [ ! -z "$channel" ] &&  [ ! -z "$value" ];
then
    echo "Sending $channel $value..."
    curl -i  -H "X-ApiKey: $apiKey" -X PUT -d "{ \"version\":\"1.0.0\", \"datastreams\" : [ { \"id\" : \"$channel\", \"current_value\" : \"$value\" } ] }" "https://api.xively.com/v2/feeds/$feedId"
else
    echo "Bugga!"
fi
