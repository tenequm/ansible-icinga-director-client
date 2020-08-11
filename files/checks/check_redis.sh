#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Missing argument..."
  echo "Usage: {$0} <cmd>"
  echo 'Example: {$0} "llen eventUnhandled_MediaClip"'
fi

CMD=`redis-cli $1`

if [[ $CMD > 10001 ]]; then
  echo "ERROR: The length of eventUnhandled_MediaClip is higher than 10001 ($CMD)"
  exit 1
else
  echo "OK: The length of eventUnhandled_MediaClip is $CMD"
  exit 0
fi
