# SSH Server Setup
from: [https://roadmap.sh/projects/ssh-remote-server-setup]
## Overview

The SSH Server Setup project is designed to help users learn and practice Linux basics by setting up a remote Linux server with SSH authentication. The goal is to configure the server to allow SSH connections using multiple key pairs and enable seamless access through an SSH configuration file.

## Features

- Registers and sets up a remote Linux server on a cloud provider.
- Generates two SSH key pairs for secure authentication.
- Configures the server to accept SSH connections using both key pairs.
- Enables easy server access via an SSH configuration file.
- (Optional) Installs and configures `fail2ban` to prevent brute-force attacks.

## Requirements

- A cloud-based Linux server (e.g., A Cloud Guru, AWS, DigitalOcean, etc.).
- Local machine with an SSH client (Linux, macOS, or Windows with WSL/Git Bash).
- `ssh-keygen` command available for generating SSH keys.
- (Optional) `fail2ban` installed for added security.

## Installation

1. Register and set up a remote Linux server on a cloud provider.
2. Generate two SSH key pairs on your local machine:
   ```sh
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/key1
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/key2
   ```
3. Copy the public keys to the server’s `~/.ssh/authorized_keys` file:
   ```sh
   echo "<key1.pub>" >> ~/.ssh/authorized_keys
   echo "<key2.pub>" >> ~/.ssh/authorized_keys
   ```
4. Set proper permissions:
   ```sh
   chmod 600 ~/.ssh/authorized_keys
   ```

## Usage

### Connecting to the Server
To connect to your server using the SSH keys:
```sh
ssh -i ~/.ssh/key1 user@server-ip
ssh -i ~/.ssh/key2 user@server-ip
```

### Configuring SSH for Easy Access
To simplify access, configure the SSH client on your local machine:

1. Edit (or create) the SSH config file:
   ```sh
   nano ~/.ssh/config
   ```
2. Add the following configuration:
   ```ini
   Host myserver
       HostName <server-ip>
       User <your-user>
       IdentityFile ~/.ssh/key1
   ```
3. Save and exit.

Now, you can connect using:
```sh
ssh myserver
```

## Output

Upon successful connection, you should see the Linux server's shell prompt, confirming that authentication via SSH keys is working correctly.

## Automating Security with `fail2ban` (Optional)

To protect against brute-force attacks, install and configure `fail2ban`:

1. Install `fail2ban`:
   ```sh
   sudo apt update && sudo apt install fail2ban -y
   ```
2. Configure SSH protection:
   ```sh
   sudo nano /etc/fail2ban/jail.local
   ```
   Add the following:
   ```ini
   [sshd]
   enabled = true
   port = 22
   maxretry = 5
   bantime = 600
   ```
3. Restart `fail2ban`:
   ```sh
   sudo systemctl restart fail2ban
   ```

This setup helps prevent unauthorized access attempts by banning IPs that fail to authenticate multiple times.
