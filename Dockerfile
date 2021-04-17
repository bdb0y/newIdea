FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN apt-get -qq update
RUN apt-get -qq install snapd
RUN snap install cmake --classic
RUN cmake --version

RUN apt-get -qq install make git zlib1g-dev libssl-dev gperf cmake g++
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR /usr/src/app/telegram-bot-api
RUN rm -rf build
RUN mkdir build

WORKDIR /usr/src/app/telegram-bot-api/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
RUN cmake --build . --target install

WORKDIR /sur/src/app
RUN ls -l telegram-bot-api/bin/telegram-bot-api*
