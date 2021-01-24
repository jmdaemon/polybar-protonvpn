#!/bin/bash

output=$(protonvpn s | awk '{print $2}')
connection_status=$(awk 'FNR == 1 {print}' <<< $output)

if [ "$connection_status" = 'Connected' ]
then
  server=$(awk 'FNR == 4 {print}' <<< $output)
  echo "$server"
else
  echo ""
fi

