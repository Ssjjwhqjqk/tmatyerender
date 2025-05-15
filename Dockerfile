FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl openssh-client git tmate && \
    apt-get clean

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
