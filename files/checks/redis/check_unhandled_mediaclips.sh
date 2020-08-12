#!/bin/bash

CMD=`redis-cli llen eventUnhandled_MediaClip`

if [[ $CMD > 10001 ]]; then
  echo "ERROR: The length of eventUnhandled_MediaClip is higher than 10001 ($CMD) | unhandled=$CMD"
  exit 1
else
  echo "OK: The length of eventUnhandled_MediaClip is $CMD | unhandled=$CMD"
  exit 0
fi
