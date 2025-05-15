#!/bin/bash

# Install tmate if not already available
apt-get update
apt-get install -y tmate

# Start tmate session and keep it alive
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Print SSH connection
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

# Keep the container running
tail -f /dev/null
