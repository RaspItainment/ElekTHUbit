FROM debian:bookworm

# setup

ENV DEBIAN_FRONTEND=noninteractive

COPY ./debian.sources /etc/apt/sources.list.d/debian.sources

RUN apt update --yes
RUN apt upgrade --yes

RUN apt install git repo bc coreutils dosfstools e2fsprogs fdisk kpartx mtools ninja-build pkg-config python3-pip procps libncurses5 m4 zip bison byacc flex sudo --yes
RUN pip3 install meson mako jinja2 ply pyyaml dataclasses --break-system-packages

RUN git config --global user.email "buildserver@buildsever.notld"
RUN git config --global user.name "Build Server"

COPY build /aaos-grapeup
WORKDIR aaos-grapeup

CMD ["bash", "/aaos-grapeup/build.sh"]
