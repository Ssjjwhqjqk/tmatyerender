FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl unzip git wget python3 && \
    apt clean

# Download and install SSHX
RUN curl -fsSL https://github.com/sshxio/sshx/releases/latest/download/sshx-linux-amd64 -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Create app directory and dummy page
WORKDIR /app
RUN echo "SSHX session running..." > index.html

# Create startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Keep container awake
EXPOSE 8080

CMD ["/start.sh"]
