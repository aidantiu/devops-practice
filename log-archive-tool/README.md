## Overview
The Log Archive Tool is a simple Bash script that archives logs from a specified directory by compressing them into a \`.tar.gz\` file. It helps in managing log files efficiently by storing them in an \`archive\` directory while maintaining a log of archived files.

## Features
- Accepts a log directory as an argument.
- Compresses all logs inside the given directory into a \`.tar.gz\` file.
- Saves the compressed file inside an \`archive\` folder.
- Names the archive with a timestamp (\`YYYYMMDD_HHMMSS\`).
- Logs each archive operation in a log file.

## Requirements
- Unix-based operating system.
- Bash shell.
- \`tar\` command installed (available by default on most systems).

## Installation
1. Clone or download the script to your local machine.
2. Make the script executable:
   ```bash
   chmod +x log-archive.sh
   ```

## Usage
Run the script from the terminal by providing the log directory:
```bash
./log-archive.sh <log-directory>
```
Example:
```bash
./log-archive.sh /var/log
```

## Output
The script will:
- Compress logs into \`logs_archive_YYYYMMDD_HHMMSS.tar.gz\` inside the \`archive\` folder.
- Log the operation in \`archive_log.txt\`.

### Example Output
```bash
Log? archived to /var/log/archive/logs_archive_20240816_100648.tar.gz
```

## Automating with Cron (Optional)
To run the script automatically every day at midnight, add a cron job:
```bash
crontab -e
```
Then add this line:
```bash
0 0 * * * /path/to/log-archive.sh /var/log
```
