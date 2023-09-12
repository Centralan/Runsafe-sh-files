#!/bin/bash
mysql -uminecraft -pHorsePoopRaddishGuilloutine minecraft1 < ~/potw.sql 
mysql -uminecraft -pHorsePoopRaddishGuilloutine minecraft1 < ~/zbuilders.sql
/usr/local/bin/bukkit command 'rs config rel WarpDrive'
/usr/local/bin/bukkit command 'pex reload'
/usr/local/bin/bukkit command 'dog speak Plot of the week has been updated, go check it out!'
