FROM debian:latest

RUN apt update && \
    apt install -y tmate openssh-client && \
    mkdir /root/.ssh

CMD ["tmate", "-F"]
