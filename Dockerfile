FROM ubuntu:20.04

RUN apt-get update 
Run apt-get install git python3 -y

WORKDIR /usr/src/app

RUN git clone https://github.com/alexbers/mtprotoproxy.git
RUN ls -al


CMD ["python3", "/usr/src/app/mtprotoproxy/mtprotoproxy.py"]
