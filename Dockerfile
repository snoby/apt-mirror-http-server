FROM ubuntu:16.04
MAINTAINER Terry Chen <seterrychen@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RESYNC_PERIOD 12h

RUN \
  apt-get update && \
  apt-get install -y  --no-install-recommends apt-mirror rsync apache2 && \
  apt-get autoclean && \
  mv /etc/apt/mirror.list / && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 80
COPY postmirror.sh /tmp/postmirror/postmirror.sh
COPY setup.sh /setup.sh

VOLUME ["/etc/apt", "/var/spool/apt-mirror", "/tmp/postmirror"]
CMD ["/bin/bash", "setup.sh"]
