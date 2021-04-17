FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN apt-get -qq update
RUN apt-get -qq install build-essential libssl-dev
RUN wget https://github.com/Kitware/CMake/releases/download/v3.16.5/cmake-3.16.5.tar.gz
RUN tar -zxvf cmake-3.16.5.tar.gz
WORKDIR /usr/src/app/cmake-3.16.5
RUN ./bootstrap
RUN make 
RUN make install 
RUN cmake --version

WORKDIR /usr/src/app
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
