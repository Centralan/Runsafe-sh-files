#!/bin/bash
su -c "bukkit command \"puppet KruKamera All players will be disconnected in 30 seconds for a brief hotfix deployment.\"" server1
sleep 30s
su -c "bukkit command \"kickall Server update deployed! Please re-log.\"" server1
su -c "bukkit command \"save-all\"" server1
sleep 1s
su -c "bukkit command \"reload\"" server1
