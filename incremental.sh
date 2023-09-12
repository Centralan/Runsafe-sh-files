#!/bin/bash
# Incremental backups of minecraft

#bukkit command 'dog speak Hourly back-up, the server may lag for a moment!'
cd ~/backups
prev='n'
for n in {24..0..-1}; do
	if [ -d "T-$n" ]; then
		mv "T-$n" "T-$prev"
	fi
	prev=$n
done
if [ -d "T-n" ]; then
	mv "T-n" "T-0"
fi
if [ -d "T-1" ]; then
	cp -fal "T-1/." "T-0"
fi

#bukkit command 'save-all'
sleep 5
cd ~
nice -n 19 mysqldump -q --single-transaction -uminecraft -pHorsePoopRaddishGuilloutine minecraft1 > bukkit/backup.sql
nice -n 19 mysqldump -q --single-transaction -uminecraft -pHorsePoopRaddishGuilloutine minecraft1 runsafeBanks > bukkit/bankBackup.sql
nice -n 19 rsync -a --delete bukkit/ "backups/T-0/" 
touch backups/T-0/
