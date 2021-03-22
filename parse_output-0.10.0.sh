#!/bin/bash

# renaissance-gpl-0.10.0
cat ${OUTPUT_DIR}/output.csv | while read line ; 
do 
ts=$(echo $line | cut -d',' -f4); 
#[ "$ts" == "unixts.before" ] && echo $line,"TS,COMPONENT" && continue ; 
[ "$ts" == "unixts.before" ] && echo $line,"timestamp," && continue ; 
echo -n $line ; 
ts=$(date -d @$(($ts/1000)) "+%Y-%m-%d %H:%M:%S %Z") ; 
#echo ",$ts,pagerank" ; 
echo ",$ts" ; 
done > ${OUTPUT_DIR}/parsed_output.csv

