#!/bin/bash

#STEP-1: install sysstat if not to run mpstat
(apt-get update && apt-get install -y sysstat) > /dev/null 2>&1

echo "1. Total CPU usage:"
mpstat | grep 'all' | awk '{print 100-$NF "%\n"}'

echo "2. Total memory usage (Free vs Used including percentage):"
free | grep 'Mem:' | awk '{print "total used: " $3/1024 "MiB (" ($3/$2)*100 "%)" "\ntotal free: " $4/1024 "MiB (" ($4/$2)*100 "%)"}'
echo "Total disk usage (Free vs Used including percentage):\n"

