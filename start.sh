#!/bin/bash

# Start dummy HTTP server to keep Render/Fly awake
python3 -m http.server 8080 &

# Start SSHX and show link
echo "Starting sshx..."
sshx serve --once
