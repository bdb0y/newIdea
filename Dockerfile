FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install make git zlib1g-dev libssl-dev gperf cmake clang-6.0 libc++-dev libc++abi-dev
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git
WORKDIR /usr/src/app/telegram-bot-api
RUN rm -rf build
RUN mkdir build
WORKDIR /usr/src/app/telegram-bot-api/build
RUN CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-6.0 CXX=/usr/bin/clang++-6.0 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
RUN cmake --build . --target install
WORKDIR /usr/src/app
RUN ls -l telegram-bot-api/bin/telegram-bot-api*
