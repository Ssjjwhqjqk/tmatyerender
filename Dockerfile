FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl unzip git wget python3 && \
    apt clean

# Download and install SSHX
RUN curl -L https://github.com/sshxio/sshx/releases/download/v0.4.2/sshx-linux-amd64 -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Set working directory
WORKDIR /app
RUN echo "SSHX session running..." > index.html

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
