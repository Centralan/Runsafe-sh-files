#!/bin/bash
cd ~server1
. .bash_profile
touch ~server1/.halted
if [ -z "$1" ]; then
	/usr/local/bin/bukkit shutdown 5 "Daily restart"
else
	/usr/local/bin/bukkit shutdown 5 "$@"
fi
cp -Ru ~server1/updates/* ~server1/bukkit/plugins/ 2> /dev/null
find ~server1/updates -type f -delete
mv ~server1/bukkit/server.log ~server1/log/`date +%Y.%m.%d.%H.%M`.log
cd ~server1/bukkit/logs
mv *.gz ~server1/log/
cd ~server1/bukkit/logging
for log in *.log; do
	mv $log ~server1/log/`date +%Y.%m.%d.%H.%M`_$log
done
cd ~server1
/usr/local/bin/bukkit start
/usr/local/bin/bukkit command "rs config reload"
rm ~server1/.halted
