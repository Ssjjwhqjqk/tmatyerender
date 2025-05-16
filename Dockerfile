FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y wget curl unzip openssh-client git python3 && \
    apt clean

# Download correct Upterm binary directly
RUN wget https://github.com/owenthereal/upterm/releases/download/v0.7.5/upterm-linux-amd64 -O /usr/local/bin/upterm && \
    chmod +x /usr/local/bin/upterm

# Dummy web directory to keep Render alive
RUN mkdir -p /app && echo "Upterm session running..." > /app/index.html
WORKDIR /app

# Keep port alive
EXPOSE 6080

# Run dummy web server + upterm
CMD python3 -m http.server 6080 & \
    upterm host --server=ssh.upterm.dev:22 --force-command=bash
