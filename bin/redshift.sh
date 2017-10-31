#!/bin/bash

if [[ $1 == "on" ]]; then
  redshift -l 55.4:7.8 -t 5700:3000 -g 0.8 -m randr &
elif [[ $1 == "off" ]]; then
  redshift -x
  pkill redshift
else
  echo "Allowed inputs are 'on' and 'off'."
  exit 1
fi
