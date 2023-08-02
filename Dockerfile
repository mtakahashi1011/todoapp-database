FROM mysql:8.0-debian

RUN apt update && apt upgrade

RUN apt install -y vim 

RUN apt install -y git 

ENV TZ Asia/Tokyo

RUN apt install -y tzdata

WORKDIR /workspace/test-mysql

COPY . .
