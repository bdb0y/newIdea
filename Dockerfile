FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN docker pull telegrammessenger/proxy
RUN apt-get -qq update
RUN apt-get -qq install docker-ce docker-ce-cli containerd.io

RUN docker run -d -p443:443 --name=mtproto-proxy --restart=always -v proxy-config:/data telegrammessenger/proxy:latest
