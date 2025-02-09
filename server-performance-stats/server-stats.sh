#!/bin/bash

# Function to display CPU usage
display_cpu_usage() {
    echo "Total CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
        awk '{printf "CPU Usage: %.1f%%\n", $2 + $4}'
    	echo ""
}

# Function to display memory usage
display_memory_usage() {
    echo "Total Memory Usage:"
    free -h | awk 'NR==2{printf "Used: %s, Free: %s, Usage: %.2f%%\n", $3, $4, $3/$2*100}'
    echo ""
}

# Function to display disk usage
display_disk_usage() {
    echo "Total Disk Usage:"
    df -h --total | awk '/total/{printf "Used: %s, Free: %s, Usage: %s\n", $3, $4, $5}'
    echo ""
}

# Function to display top 5 processes by CPU usage
display_top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo ""
}

# Function to display top 5 processes by memory usage
display_top_memory_processes() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo ""
}

# Main function
main() {
    display_cpu_usage
    display_memory_usage
    display_disk_usage
    display_top_cpu_processes
    display_top_memory_processes
}

main

