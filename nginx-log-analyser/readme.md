# Nginx Log Analysis Script

from: https://roadmap.sh/projects/nginx-log-analyser

This is a simple Bash script designed to analyze an Nginx access log file and extract useful insights such as the most active IP addresses, most requested paths, response status codes, and user agents. This script helps to quickly assess traffic patterns and potential issues in a web server.

## Features

- **Top 5 IP Addresses:** Displays the top 5 IPs making the most requests.
- **Top 5 Most Requested Paths:** Lists the most accessed URLs, excluding repetitive health check endpoints.
- **Top 5 Response Status Codes:** Shows the most common HTTP response codes (excluding missing or malformed entries).
- **Top 5 User Agents:** Identifies the most common user agents making requests to the server.

## Usage

1. Download or clone the script.
2. Make the script executable by running:
   
   ```bash
   chmod +x nginx_log_analysis.sh
   ```

3. Run the script with the path to the Nginx access log:
   
   ```bash
   ./nginx_log_analysis.sh /path/to/nginx_access.log
   ```

## Output

The script provides the following insights:

- **Top 5 IP Addresses** with the highest number of requests.
- **Top 5 Requested Paths** excluding `/v1-health` to avoid redundancy.
- **Top 5 Response Status Codes** with missing or invalid entries filtered out.
- **Top 5 User Agents** sorted by request frequency.

### Example Output

```bash
Top 5 IP addresses with the most requests:
192.168.1.1 - 150 requests
203.0.113.42 - 120 requests
198.51.100.8 - 95 requests
10.0.0.5 - 80 requests
172.16.4.10 - 75 requests

Top 5 most requested paths:
/api/v1/data - 300 requests
/index.html - 250 requests
/login - 200 requests
/images/logo.png - 150 requests
/css/style.css - 100 requests

Top 5 response status codes:
200 - 4500 requests
404 - 1200 requests
500 - 300 requests
403 - 150 requests
302 - 90 requests

Top 5 user agents:
Mozilla/5.0 - 1000 requests
curl/7.68.0 - 800 requests
Googlebot/2.1 - 500 requests
PostmanRuntime/7.26 - 350 requests
ApacheBench/2.3 - 200 requests
```

## Requirements

- **Bash:** The script is written in Bash and should be run in a Bash shell.
- **Common Unix Utilities:** Uses `awk`, `sort`, `uniq`, and `head` which are available in most Unix-like systems.

This script provides a quick and efficient way to analyze web traffic patterns from an Nginx access log. 🚀


