FROM ubuntu:latest as build-stage

ARG TMUX_VERSION=3.6
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

RUN wget -O- https://github.com/tmux/tmux/archive/${TMUX_VERSION}.tar.gz  | tar -xzvf - && \
    mv tmux-${TMUX_VERSION} /tmux
WORKDIR tmux
RUN ./autogen.sh && ./configure --enable-static && make -j8

FROM scratch as exporter
COPY --from=build-stage /tmux/tmux /
