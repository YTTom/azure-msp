FROM ubuntu:16.04
MAINTAINER yttom

ENV http_proxy=http://10.160.3.88:8080
ENV https_proxy=http://10.160.3.88:8080
ENV no_proxy=127.0.0.1,localhost
RUN export http_proxy https_proxy no_proxy
RUN apt-get update

#RUN apk add python-minimal software-properties-common python-pip
RUN apt-get install python-minimal -y
RUN apt-get install software-properties-common python python-pip -y
RUN  mkdir /app

EXPOSE 5000
WORKDIR /home/ubuntu/test_python_yt
COPY . /app
RUN pip install --no-cache-dir -r /app/requirements.txt
RUN apt-get install curl telnet lsof -y
#
ENTRYPOINT python /app/test.py
