#!/bin/bash

ping_hosts=($(cat $1))

echo "time,from,to,packet_loss,avg_latency" > /tmp/pinger.txt
for line in ${ping_hosts[@]}
do
        from=$(echo $line | cut -d ',' -f1)
        to=$(echo $line | cut -d ',' -f2)
        packets=$(echo $line | cut -d ',' -f3)
        nohup ssh $from "date +%Y-%m-%dT%H:%M:%SZ && hostname && ping -c $packets -q -n $to" 2>/dev/null | paste -sd ' ' | tr -s "/" " " | cut -d " " -f1,2,4,20,32 | tr -d '%' | tr -s ' ' ',' >> /tmp/pinger.txt &
done
wait
cat /tmp/pinger.txt
