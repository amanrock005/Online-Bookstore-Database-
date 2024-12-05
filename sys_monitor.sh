
#!/bin/bash
# =====================================
# System performance monitoring script 
# =====================================
# Author: Amanpreet 
# Version: 1.0
# Date created: 30-11-2024
# Description: 
# To monitor CPU, memory, and disk usage 
# displaying current system status 
# Usage: ./sys_monitor.sh 
# Last updated: 
# Last updated by: 
# ======================================

cpu_usage() {
  echo "CPU Usage:"
  top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "%"}'
}

memory_usage() {
  echo "memory usage:"
  free -h | grep "Mem" | awk '{print "Memory Used: " $3 " / " $2}'
}

disk_usage() {
  echo "disk usage"
  df -h | grep "^/dev"
}

echo "system performance script"
echo "-------------------------"
cpu_usage
memory_usage
disk_usage

# log output 
log_file="system_monitor.log"
echo "$(date):CPU and memory check completed" >> "$log_file"
echo "log written to $log_file"

exit 0
