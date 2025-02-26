# Dummy Systemd Service

This project is designed to help you get familiar with **systemd**, including creating and enabling a service, checking its status, managing logs, and handling service restarts.

## Project Overview
The goal of this project is to create a **dummy systemd service** that:
- Runs a script (`dummy.sh`) continuously in the background.
- Writes log messages every 10 seconds.
- Starts automatically on boot.
- Restarts automatically if it fails.

## Setup Instructions

### 1. Create the `dummy.sh` Script
```bash
nano dummy.sh
```
#### Add the following content:
```bash
#!/bin/bash

while true; do
  echo "$(date) - Dummy service is running..." >> /var/log/dummy-service.log
  sleep 10
done
```
#### Make the script executable:
```bash
chmod +x dummy.sh
```

### 2. Create the `dummy.service` Systemd Service File
```bash
nano dummy.service
```
#### Add the following content:
```ini
[Unit]
Description=Dummy Service
After=network.target

[Service]
ExecStart=/path/to/dummy.sh
Restart=always
User=your-username
StandardOutput=append:/var/log/dummy-service.log
StandardError=append:/var/log/dummy-service.log

[Install]
WantedBy=multi-user.target
```
**Replace `/path/to/dummy.sh` with the actual path to your script.**
**Replace `your-username` with your actual username.**

### 3. Move the Service File to systemd Directory
```bash
sudo cp dummy.service /etc/systemd/system/
```

### 4. Reload systemd and Enable the Service
```bash
sudo systemctl daemon-reload
sudo systemctl enable dummy
sudo systemctl start dummy
```

### 5. Verify the Service
Check the status:
```bash
sudo systemctl status dummy
```
Check logs in real-time:
```bash
sudo journalctl -u dummy -f
```
Check the log file directly:
```bash
tail -f /var/log/dummy-service.log
```

### 6. Manage the Service
- **Stop the service**:  
  ```bash
  sudo systemctl stop dummy
  ```
- **Disable the service** (prevent it from starting on boot):  
  ```bash
  sudo systemctl disable dummy
  ```
- **Restart the service**:  
  ```bash
  sudo systemctl restart dummy
  ```

## Debugging Tips
- If the service is not starting, check logs:
  ```bash
  sudo journalctl -xe
  ```
- If you modify `dummy.service`, reload systemd:
  ```bash
  sudo systemctl daemon-reload
  ```
- Verify the service file:
  ```bash
  sudo systemd-analyze verify /etc/systemd/system/dummy.service
  ```

From: [https://roadmap.sh/projects/dummy-systemd-service/solutions](https://roadmap.sh/projects/dummy-systemd-service/solutions)


