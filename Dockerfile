FROM ubuntu:latest as build-stage
ENV  DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y \
	automake \
	bison \
	build-essential \
	libevent-dev \
	ncurses-dev \
	pkg-config \
	wget

RUN wget -O- https://github.com/tmux/tmux/archive/3.1c.tar.gz  | tar -xzvf -
WORKDIR tmux-3.1c
RUN ./autogen.sh && ./configure --enable-static && make -j8

FROM scratch as exporter
COPY --from=build-stage /tmux-3.1c/tmux /
