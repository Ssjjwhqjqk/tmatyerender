FROM ubuntu:22.04

# Install packages
RUN apt update && \
    apt install -y wget curl git tmate neofetch python3 && \
    apt clean

# Set up welcome message with neofetch
RUN echo "clear && neofetch && tmate" > /root/.bashrc

# Create a dummy app directory
WORKDIR /app
RUN echo "Render container running..." > index.html

# Expose a port to keep it alive
EXPOSE 8080

# Start dummy HTTP server to keep container alive
CMD python3 -m http.server 8080
