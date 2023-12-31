#!/bin/bash
. .bash_profile
set +x
if [ -f ~server1/.halted ]; then
	exit 0;
fi
cd ~server1/bukkit
crashed=`ls -al crash-reports/* 2>/dev/null | wc -l`
if [ $crashed -gt 0 ]; then
	echo 'Server has crashed!';
	for i in crash-reports/*; do
		echo ============================== $i =============================
		cat $i
		echo ============================== $i =============================
		echo
		mv $i ../crash-reports/
	done
	/usr/local/bin/bukkit restart 0
else
	running=`screen -ls | grep -v "No Sockets" | grep -c server1`
	if [ $running -eq 0 ]; then
		echo not running, not crashed!
		/usr/local/bin/bukkit start
	fi
fi
