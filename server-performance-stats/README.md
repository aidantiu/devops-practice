# System Monitoring Script

This is a simple Bash script designed to monitor key system metrics such as CPU usage, memory usage, disk usage, and the top processes consuming CPU and memory resources. The script provides a quick overview of the system's performance and resource utilization.

## Features

- **CPU Usage:** Displays the total CPU usage as a percentage.
- **Memory Usage:** Shows the total memory usage, including used memory, free memory, and the percentage of memory in use.
- **Disk Usage:** Provides an overview of disk usage, including used space, free space, and the percentage of disk space used.
- **Top Processes:** Lists the top 5 processes by CPU usage and the top 5 processes by memory usage.

## Usage

1. Clone the repository or download the script to your local machine.
2. Make the script executable by running the following command:

   \`\`\`bash
   chmod +x server-stats.sh
   \`\`\`

3. Run the script:

   \`\`\`bash
   ./server-stats.sh
   \`\`\`

## Output

The script will output the following information:

- **Total CPU Usage:** The overall CPU usage as a percentage.
- **Total Memory Usage:** The amount of memory used, free, and the percentage of memory in use.
- **Total Disk Usage:** The amount of disk space used, free, and the percentage of disk space used.
- **Top 5 Processes by CPU Usage:** The top 5 processes consuming the most CPU resources.
- **Top 5 Processes by Memory Usage:** The top 5 processes consuming the most memory resources.

### Example Output

\`\`\`bash
Total CPU Usage:
CPU Usage: 15.3%

Total Memory Usage:
Used: 3.2G, Free: 1.5G, Usage: 68.00%

Total Disk Usage:
Used: 120G, Free: 80G, Usage: 60%

Top 5 Processes by CPU Usage:
  PID COMMAND         %CPU
  123 chrome          25.0
  456 mysqld          10.5
  789 bash             5.3
  101 sshd             3.2
  102 systemd          2.1

Top 5 Processes by Memory Usage:
  PID COMMAND         %MEM
  456 mysqld          20.0
  123 chrome          15.5
  789 bash             5.0
  101 sshd             3.0
  102 systemd          2.5
\`\`\`

## Requirements

- **Bash:** The script is written in Bash and should be run in a Bash shell.
- **Common Unix Utilities:** The script uses common Unix utilities like \`top\`, \`free\`, \`df\`, and \`ps\`, which are typically available on most Unix-like systems.
