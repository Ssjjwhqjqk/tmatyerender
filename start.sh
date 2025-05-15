#!/bin/bash

# Install tmate if not already available
apt-get update
apt-get install -y tmate expect

# Start tmate
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Display SSH command in logs
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

# Auto-type "ping" every 5 minutes inside the session
while true; do
    tmate -S /tmp/tmate.sock send-keys "echo alive && date" C-m
    sleep 300  # 5 minutes
done
