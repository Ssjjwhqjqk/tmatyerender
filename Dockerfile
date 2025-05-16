FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y wget curl unzip openssh-client git python3 && \
    apt clean

# Download and install Upterm
RUN wget https://github.com/owenthereal/upterm/releases/latest/download/upterm-linux-amd64 -O /usr/local/bin/upterm && \
    chmod +x /usr/local/bin/upterm

# Create a dummy web server directory
RUN mkdir -p /app && echo "Upterm session running..." > /app/index.html
WORKDIR /app

# Expose port 6080 to keep the container alive
EXPOSE 6080

# Start a dummy HTTP server and launch Upterm
CMD python3 -m http.server 6080 & \
    upterm host --force-command bash
