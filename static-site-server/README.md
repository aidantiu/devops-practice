# Deploying a Static Site with Nginx and Rsync

This guide explains how to set up and deploy a static website using **Nginx** and **rsync**. The deployment script automates the process of syncing local files to a remote server and restarting Nginx.

## Features
- Deploys a static site using **Nginx**.
- Uses **rsync** to sync files from local to remote.
- Automatically restarts **Nginx** after deployment.

---

## Prerequisites

### **On Your Local Machine:**
- **Linux/macOS terminal or WSL (Windows Subsystem for Linux)**
- **rsync** installed (`sudo apt install rsync` or `brew install rsync`)
- SSH access to the remote server

### **On the Remote Server:**
- Ubuntu or another Linux distribution
- Nginx installed (`sudo apt install nginx`)
- A directory for the static site (e.g., `/var/www/mysite/`)
- Correct permissions to allow file transfers and Nginx restarts

---

## Setup Instructions

### **1. Configure the Remote Server**
```bash
sudo mkdir -p /var/www/mysite
sudo chown -R <remote_user>:<remote_user> /var/www/mysite
chmod -R 755 /var/www/mysite
```

Ensure Nginx is set up to serve files from this directory:
```bash
sudo nano /etc/nginx/sites-available/mysite
```
Add the following configuration:
```nginx
server {
    listen 80;
    server_name yourdomain.com;
    root /var/www/mysite;
    index index.html;
}
```
Enable the site and restart Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

---

### **2. Deploy Script (`deploy.sh`)**
Create a `deploy.sh` script in your local project directory:
```bash
#!/bin/bash

LOCAL_DIR="/path/to/your/static-site/"
REMOTE_USER="your_remote_user"
REMOTE_HOST="your.remote.server"
REMOTE_DIR="/var/www/mysite/"

# Sync files
rsync -avz --delete "$LOCAL_DIR" $REMOTE_USER@$REMOTE_HOST:"$REMOTE_DIR"

# Restart Nginx
ssh -t $REMOTE_USER@$REMOTE_HOST "sudo systemctl restart nginx"

echo "Deployment complete."
```
Make it executable:
```bash
chmod +x deploy.sh
```

---

### **3. Deploy Your Site**
Run the deployment script:
```bash
./deploy.sh
```

After deployment, visit your domain or server IP to see your static site live!

---

## Troubleshooting

### **Files Not Appearing on Remote Server?**
- Ensure `rsync` is syncing to the correct remote path: `/var/www/mysite/`
- Run `ls -lah /var/www/mysite/` on the remote server to check file presence.

### **Permission Issues?**
- Ensure your remote user has write access to `/var/www/mysite/`:
  ```bash
  sudo chown -R <remote_user>:<remote_user> /var/www/mysite
  ```
- If `rsync` needs `sudo`, enable passwordless sudo for rsync:
  ```bash
  sudo visudo
  ```
  Add this line:
  ```bash
  <remote_user> ALL=(ALL) NOPASSWD: /usr/bin/rsync
  ```

---

