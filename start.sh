#!/bin/bash

# Start dummy HTTP server in background
python3 -m http.server 8080 &

# Run SSHX
sshx serve --once
