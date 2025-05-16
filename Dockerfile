FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y wget curl unzip openssh-client git python3 && \
    apt clean

# Download and install Upterm
RUN wget https://github.com/owenthereal/upterm/releases/latest/download/upterm_linux_amd64.tar.gz -O /tmp/upterm.tar.gz && \
    tar -xzf /tmp/upterm.tar.gz -C /usr/local/bin/ && \
    chmod +x /usr/local/bin/upterm && \
    rm /tmp/upterm.tar.gz

# Create a dummy web server to keep Render container awake
RUN mkdir -p /app && echo "Upterm session running..." > /app/index.html
WORKDIR /app

# Expose dummy port to prevent sleep
EXPOSE 6080

# Start Upterm and dummy web server
CMD python3 -m http.server 6080 & \
    upterm host --server ssh.upterm.dev:22 --force-command bash on 
