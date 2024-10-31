FROM ubuntu:latest as build-stage

ARG TMUX_VERSION=3.5
ENV TMUX_VERSION=${TMUX_VERSION}
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y \
	automake \
	bison \
	build-essential \
	libevent-dev \
	ncurses-dev \
	pkg-config \
	wget

RUN wget -O- https://github.com/tmux/tmux/archive/${TMUX_VERSION}.tar.gz  | tar -xzvf -
WORKDIR tmux-${TMUX_VERSION}
RUN ./autogen.sh && ./configure --enable-static && make -j8

FROM scratch as exporter
ARG TMUX_VERSION
COPY --from=build-stage /tmux-${TMUX_VERSION}/tmux /
