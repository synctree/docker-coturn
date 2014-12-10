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

For debugging purposes, [`docker exec`](https://docs.docker.com/reference/commandline/cli/#exec)
should be used since this container does not run an SSH daemon.

Due to the need for the TURN server to open arbitrary ports to the outside
world and Docker's lack of range-based port mapping (https://github.com/docker/docker/issues/8899), additional configuration is needed to allow clients to talk to this ports. This can be accomplished in a number of ways, including the use of `iptables` in combination with something like [`docker-gen`](https://github.com/jwilder/docker-gen) or using Docker's host networking (`--net host`) feature. The use of host networking is not recommended due to the many security issues it raises.

### Usage

To run this container:

    $ docker run -d synctree/coturn:latest
