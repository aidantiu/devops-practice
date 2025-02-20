#!/bin/bash
echo "Removing Netdata..."
sudo systemctl stop netdata
sudo apt remove --purge netdata -y
echo "Netdata removed successfully."

