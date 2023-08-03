FROM mysql:8.0-debian

RUN apt update && apt upgrade

RUN apt install -y vim 

RUN apt install -y git 

RUN apt install locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

ENV TZ Asia/Tokyo

RUN apt install -y tzdata

WORKDIR /workspace/test-mysql

COPY . .

// RUN /usr/bin/mysqld_safe & sleep 10s && cat setup.sql | mysql
