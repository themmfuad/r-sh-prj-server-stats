#!/bin/bash

#STEP-1: install sysstat if not to run mpstat
(apt-get update && apt-get install -y sysstat) > /dev/null 2>&1

echo "[1.] Total CPU usage:\n.........................................................."
mpstat | grep 'all' | awk '{print 100-$NF "%\n"}'

echo "[2.] Total memory usage (Free vs Used including percentage):\n.........................................................."
free | grep 'Mem:' | awk '{print "total used: " $3/1024 "MiB (" ($3/$2)*100 "%)" "\ntotal free: " $4/1024 "MiB (" ($4/$2)*100 "%)"}'

echo "\n[3.] Total disk usage (Free vs Used including percentage):\n.........................................................."
df -h / | grep "dev" | awk '{print "used: " $3 "(" $5 ")\n" "free: " $4 "(" 100-$5 ")"}'

echo "\n[4.] Top 5 processes by CPU usage:\n.........................................................."
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | grep -v "ps -eo" | head -n 6
