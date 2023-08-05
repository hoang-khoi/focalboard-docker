FROM debian:bookworm

RUN apt-get update
RUN apt-get install -y wget

RUN wget https://github.com/mattermost/focalboard/releases/download/__VERSION__/focalboard-server-linux-amd64.tar.gz
RUN tar -xvzf focalboard-server-linux-amd64.tar.gz
RUN mv focalboard /opt

WORKDIR /opt/focalboard
COPY ./config.json ./config.json

EXPOSE 8000
ENTRYPOINT ["./bin/focalboard-server"]
