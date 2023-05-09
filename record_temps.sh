#!/bin/bash
duration=$1
end=$((SECONDS+duration*60))
interval=5
bar_width=50
while [ $SECONDS -le $end ]
do
  time=$(date +%H:%M:%S)
  temp=$(cat /sys/class/thermal/thermal_zone0/temp)
  temp=$(($temp/1000))
  echo "$time $temp" >> cpu_temp_log.txt

  # Calculate progress
  progress=$((($SECONDS * $bar_width) / ($duration * 60)))
  percent=$((($progress * 100) / $bar_width))

  # Print progress bar
  echo -ne "\r["
  for i in $(seq 1 $bar_width); do
    if [ $i -le $progress ]; then
      echo -ne "="
    else
      echo -ne " "
    fi
  done
  echo -ne "] $percent%"

  sleep $interval
done
echo # move the cursor to the next line

