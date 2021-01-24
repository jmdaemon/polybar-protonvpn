#!/bin/bash

output=$(protonvpn s | awk '{print $2}')
connection_status=$(awk 'FNR == 1 {print}' <<< $output)

if [ "$connection_status" = 'Connected' ]
then
  server=$(awk 'FNR == 4 {print}' <<< $output)
  emoji=$([ $(awk 'FNR == 5 {print}' <<< $output) == "Secure-Core" ] && echo "🔐" || echo "🔒")
  echo "$emoji $server"
else
  echo ""
fi

