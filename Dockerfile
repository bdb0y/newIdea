FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN apt-get -qq update

WORKDIR /usr/src/app
RUN apt-get install make git zlib1g-dev libssl-dev gperf cmake clang-10 libc++-dev libc++abi-dev -y
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR /usr/src/app/telegram-bot-api
RUN rm -rf build
RUN mkdir build

WORKDIR /usr/src/app/telegram-bot-api/build
RUN CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-10 CXX=/usr/bin/clang++-10 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
RUN cmake --build . --target install

WORKDIR /sur/src/app
RUN ls -l telegram-bot-api/bin/telegram-bot-api*
