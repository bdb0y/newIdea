FROM ubuntu:20.04

RUN apt-get update 
Run apt-get install --no-install-recommends git python3 python3-uvloop python3-cryptography python3-socks libcap2-bin ca-certificates -y 
RUN rm -rf /var/lib/apt/lists/*
RUN setcap cap_net_bind_service=+ep /usr/bin/python3.8

RUN useradd tgproxy -u 10000

USER tgproxy
WORKDIR /usr/src/app

RUN git clone --recursive https://github.com/alexbers/mtprotoproxy.git
WORKDIR /usr/src/mtprotoproxy

WORKDIR /home/tgproxy/

COPY --chown=tgproxy /usr/src/app/mtprotoproxy/mtprotoproxy.py /usr/src/app/mtprotoproxy/config.py /home/tgproxy/

CMD ["python3", "mtprotoproxy.py"]
