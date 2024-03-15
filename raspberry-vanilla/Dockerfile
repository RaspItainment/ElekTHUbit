FROM debian:bookworm

# setup

ENV DEBIAN_FRONTEND=noninteractive

COPY ./debian.sources /etc/apt/sources.list.d/debian.sources

RUN apt update --yes
RUN apt upgrade --yes

RUN apt install repo bc coreutils dosfstools e2fsprogs fdisk kpartx mtools ninja-build pkg-config python3-pip --yes
RUN pip3 install meson mako jinja2 ply pyyaml dataclasses --break-system-packages

COPY build /raspberry-vanilla

CMD ["bash", "/raspberry-vanilla/build.sh"]
