#!/bin/bash
cd /home/server1/bukkit
for target in */players/; do
	find ./$target -type f -mtime +180 -delete
done
