#!/bin/bash
echo "Simulating CPU load..."
stress --cpu 2 --timeout 30  # Install `stress` if needed: sudo apt install stress
echo "Load test completed."

