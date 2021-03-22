#!/bin/bash

#renaissance-gpl-0.11.0
cat output.csv | while read line ; 
do 
ts=$(echo $line | cut -d',' -f4); 
uptime=$(echo $line | cut -d',' -f3) ; 
# [ "$ts" = "vm_start_unix_ms" ] && echo $line,"TS,component" && continue ; 
[ "$ts" = "vm_start_unix_ms" ] && echo $line,"TS" && continue ; 
echo -n $line ; 
ts=$(date -d @$((($ts+($uptime/1000000))/1000)) "+%Y-%m-%d %H:%M:%S %Z") ; 
#echo ",$ts,pagerank" ; 
echo ",$ts" ; 
done > parsed_output.csv
