#!/bin/sh

tmpfile="protonvpn-status-cache"
connection_status=$(protonvpn-cli s | awk '{print $2}' | grep "Connection")
if [ "$connection_status" == 'Connection' ]; then
    server=$(protonvpn-cli s | grep "Server:" | tr -d ' ' | awk '{print $2}')
    echo "$(protonvpn-cli s)" > /tmp/$tmpfile
    emoji="嬨 "
    echo "$emoji $server"
else
    echo ""
fi
