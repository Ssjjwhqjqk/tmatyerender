FROM ubuntu:22.04

# Install shellinabox and dependencies
RUN apt update && \
    apt install -y shellinabox && \
    apt clean

# Expose default shellinabox port
EXPOSE 4200

# Run shellinaboxd to serve shell on port 4200, with no SSL (for simplicity)
CMD shellinaboxd --no-beep --port=4200 --disable-ssl --user=root --group=root --localhost-only=0
