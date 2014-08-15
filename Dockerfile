FROM debian:jessie
MAINTAINER Mike Dillon <mike.dillon@synctree.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
            coturn \
            curl \
            procps \
            --no-install-recommends

ADD turnserver.sh /turnserver.sh

CMD ["/bin/sh", "/turnserver.sh"]
