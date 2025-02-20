# Netdata Monitoring Project

from: https://roadmap.sh/projects/simple-monitoring-dashboard

## Overview
This project is designed to help you learn the basics of system monitoring using Netdata. You will install Netdata, configure system metrics, access the dashboard, set up alerts, and automate the setup with shell scripts.

## Features
- **Real-time Monitoring**: Track system performance, including CPU, memory, and disk usage.
- **Dashboard Customization**: Modify and add charts to the Netdata dashboard.
- **Alert System**: Get notified when system metrics exceed thresholds.
- **Automation Scripts**:
  - `setup.sh`: Installs Netdata.
  - `test_dashboard.sh`: Generates system load for testing.
  - `cleanup.sh`: Removes Netdata from the system.

## Installation
To install Netdata, run:

```bash
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
```

## Usage
### Accessing the Dashboard
Once installed, open a web browser and visit:

```
http://your-server-ip:19999
```

### Running Automation Scripts
#### Install Netdata:
```bash
./setup.sh
```

#### Simulate System Load:
```bash
./test_dashboard.sh
```

#### Remove Netdata:
```bash
./cleanup.sh
```

## Configuration
### Modify Netdata Settings
Edit the Netdata configuration file:
```bash
sudo nano /etc/netdata/netdata.conf
```

### Setting Up Alerts
For example, to trigger an alert when CPU usage exceeds 80%, edit:
```bash
sudo nano /etc/netdata/health.d/cpu.conf
```
Add the following:
```ini
alarm: cpu_usage
on: system.cpu
lookup: average -1m
units: %
warn: $this > 80
crit: $this > 90
```
Restart Netdata to apply changes:
```bash
sudo systemctl restart netdata
```

## Cleanup
To completely remove Netdata:
```bash
./cleanup.sh
```

