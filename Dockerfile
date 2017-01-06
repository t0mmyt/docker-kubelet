FROM debian:stable
MAINTAINER Tom Taylor <tom+dockerfile@tomm.yt>

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates socat
COPY kubelet kubelet

ENTRYPOINT ["/kubelet"]
