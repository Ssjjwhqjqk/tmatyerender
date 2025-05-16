#!/bin/bash

# Start dummy server to prevent container from sleeping
python3 -m http.server 8080 &

# Start SSHX session (auto generates link)
sshx serve --once
