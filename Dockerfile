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

# Create a dummy web server directory
RUN mkdir -p /app && echo "Upterm session running..." > /app/index.html
WORKDIR /app

# Expose port 6080 to keep the container alive
EXPOSE 6080

# Start a dummy HTTP server and launch Upterm
CMD python3 -m http.server 6080 & \
    upterm host --force-command bash
