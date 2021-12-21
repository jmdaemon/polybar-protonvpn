#!/bin/sh

tmpfile="protonvpn-status-cache"
[[ -e "/usr/bin/protonvpn-cli" ]] &&  exit 1 || :
connection_status=$(protonvpn-cli s | awk '{print $2}' | grep "Connection")
[[ $connection_status -eq 1 ]] && exit 1 || :
if [ "$connection_status" == 'Connection' ]; then
    server=$(protonvpn-cli s | grep "Server:" | tr -d ' ' | awk '{print $2}')
    echo "$(protonvpn-cli s)" > /tmp/$tmpfile
    emoji="嬨 "
    echo "$emoji $server"
else
    echo ""
fi
