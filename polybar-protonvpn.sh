#!/bin/bash

output=$(protonvpn s | awk '{print $2}')

connection_status=$(awk 'FNR == 1 {print}' <<< $output)

if [ "$connection_status" = 'Connected' ]
then
  # create cache for `notify-send` because `protonvpn s` is very slow
  cache_filename="protonvpn-status-cache"
  rm /tmp/$cache_filename.*
  tmpfile=$(mktemp /tmp/$cache_filename.XXXXX)
  echo "$output" > $tmpfile

  server=$(awk 'FNR == 4 {print}' <<< $output)
  emoji=$([ $(awk 'FNR == 5 {print}' <<< $output) == "Secure-Core" ] && echo "🔐" || echo "🔒")
  echo "$emoji $server"
else
  echo ""
fi

