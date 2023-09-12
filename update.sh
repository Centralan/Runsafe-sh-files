#!/bin/bash
touch ~server1/.halted
if [ -z "$1" ]; then
	bukkit shutdown 5 "Restarting to deploy server updates"
else
	bukkit shutdown 5 "$@"
fi
cp -Ru ~server1/updates/* ~server1/bukkit/plugins/
find ~server1/updates -type f -delete
bukkit start
rm ~server1/.halted
