# FROM ubuntu:18.04

# WORKDIR /usr/src/app
# RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get install make git zlib1g-dev libssl-dev gperf cmake clang-6.0 libc++-dev libc++abi-dev -y
# RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git
# WORKDIR /usr/src/app/telegram-bot-api
# RUN rm -rf build
# RUN mkdir build
# WORKDIR /usr/src/app/telegram-bot-api/build
# RUN CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-6.0 CXX=/usr/bin/clang++-6.0 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
# RUN cmake --build . --target install
# WORKDIR /usr/src/app
# RUN ls -l telegram-bot-api/bin/telegram-bot-api*

FROM alpine:latest as buildBase
RUN apk add --no-cache alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake
ADD . /srv
WORKDIR /srv
RUN git submodule update --init --recursive && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DCMAKE_BUILD_TYPE=Release ..
RUN cd /srv/build && cmake --build . --target install

FROM alpine:latest
RUN apk add --no-cache zlib-dev openssl-dev libstdc++
COPY --from=buildBase /srv/build/telegram-bot-api /srv/telegram-bot-api
ENTRYPOINT ["/srv/telegram-bot-api"]
