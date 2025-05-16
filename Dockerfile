FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y curl unzip git wget python3 ca-certificates && \
    apt clean

# Download and install SSHX (fixed version)
RUN curl -L https://github.com/sshxio/sshx/releases/download/v0.4.2/sshx-linux-amd64 -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Create working directory
WORKDIR /app
RUN echo "SSHX is running..." > index.html

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Keep container alive on Render
EXPOSE 8080

CMD ["/start.sh"]
