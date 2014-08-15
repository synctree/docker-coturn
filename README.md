docker-coturn
=============

A Docker container running the coturn STUN/TURN server (https://code.google.com/p/coturn/)

Unlike bprodoehl/turnserver (https://github.com/bprodoehl/docker-turnserver),
this image is not based on phusion/baseimage, but runs the turnserver directly
in the container as PID 1. All logging is send to stdout.

Like bprodoehl/turnserver, this container accepts the `EXTERNAL_IP` environment
variable to tell coturn its external IP address. If `EXTERNAL_IP` is not
supplied, the external IP will be fetched using icanhazip
(http://major.io/icanhazip-com-faq/) using curl.

For debugging purposes, docker-enter (https://github.com/jpetazzo/nsenter)
should be used since this container does not run and SSH daemon.

Due to the need for the TURN server to open arbitrary ports to the outside
world and Docker's lack of range-based port mapping, running with host
networking recommended. This means that only one instance of this container can
be running on a host at a time, otherwise the network ports cannot be bound.

### Usage

To run this container with host networking:

    $ docker run -d --net host synctree/coturn:latest
