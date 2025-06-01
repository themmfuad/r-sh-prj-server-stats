#!/bin/bash

#STEP-1: install sysstat if not to run mpstat
(apt-get update && apt-get install -y sysstat) > /dev/null 2>&1

echo "Total CPU usage:"
mpstat | grep 'all' | awk '{print 100-$NF "%"}'
