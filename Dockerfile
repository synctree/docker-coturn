FROM debian:jessie
MAINTAINER Mike Dillon <mike.dillon@synctree.com>

# XXX: Workaround for https://github.com/docker/docker/issues/6345
RUN ln -s -f /bin/true /usr/bin/chfn

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
            coturn \
            curl \
            procps \
            --no-install-recommends

ADD turnserver.sh /turnserver.sh

EXPOSE 3478 3478/udp
CMD ["/bin/sh", "/turnserver.sh"]
