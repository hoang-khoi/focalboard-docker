FROM debian:bookworm AS base
WORKDIR /build

FROM base as debug
RUN apt-get update
RUN apt-get install -y make golang git npm

RUN git clone https://github.com/mattermost/focalboard.git
WORKDIR ./focalboard
RUN make prebuild
RUN make server-linux-package

ENTRYPOINT ["sleep", "infinity"]

FROM base as release
#RUN tar -xvzf focalboard-server-linux-amd64.tar.gz
#RUN mv focalboard /opt

COPY ./config.json ./config.json

EXPOSE 8000
ENTRYPOINT ["./bin/focalboard-server"]
