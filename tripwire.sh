#!/bin/bash
cd /home/server1/bukkit
user=minecraft
passwd=HorsePoopRaddishGuilloutine
echo "DELETE FROM playerNotes WHERE tier='floating';" | mysql -u$user -p$passwd minecraft1
grep 'floating too long' ../log/* \
| awk '{print $4}' | sort | uniq -c | sort -n \
| awk '{print "insert into playerNotes (playerName, tier, note) VALUES ('"'"'" $2 "'"'"', '"'"'floating'"'"', '"'"'floated too long x" $1 "'"'"');"}' \
| mysql -u$user -p$passwd minecraft1

