FROM --platform=linux/amd64 mysql:8.0-debian

RUN apt update 

RUN apt install -y vim 

RUN apt install -y git 

RUN apt install -y locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

ENV TZ Asia/Tokyo

RUN apt install -y tzdata

WORKDIR /workspace/test-mysql

ENV MYSQL_DATABASE todo_app
ENV MYSQL_ROOT_PASSWORD password

COPY . .

COPY ./db/conf.d/my.cnf /etc/mysql/my.cnf

# RUN /usr/bin/mysqld_safe & sleep 10s && cat setup.sql | mysql
