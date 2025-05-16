FROM ubuntu:22.04

# Install required packages
RUN apt update && \
    apt install -y curl wget unzip git python3 ca-certificates && \
    apt clean

# Install sshx (version v0.4.2 as of May 2025)
RUN curl -L https://github.com/sshxio/sshx/releases/download/v0.4.2/sshx-linux-amd64 -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Dummy directory to keep HTTP alive
WORKDIR /app
RUN echo "SSHX session active" > index.html

EXPOSE 8080

# Run dummy server AND sshx in one line
CMD python3 -m http.server 8080 & /usr/local/bin/sshx serve --once
