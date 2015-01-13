FROM debian:latest
MAINTAINER Adam Simpson, asimpson@grahamdigital.com
ENV DEBIAN_FRONTEND noninteractive

ENV PYTHON_VERSION 3.4.2

WORKDIR /opt


RUN apt-get update && apt-get install -y curl build-essential libncursesw5-dev \
  libreadline-gplv2-dev libssl-dev libgdbm-dev libc6-dev libsqlite3-dev tk-dev \
  && apt-get clean

RUN curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz | tar xvz

RUN  cd Python-$PYTHON_VERSION/ \
  && ./configure --prefix=/opt/python3 \
  && make \
  && make install \
  && rm -r /opt/Python-$PYTHON_VERSION/

RUN ln -s /opt/python3/bin/easy_install-3.4 /usr/local/bin/easy_install \
  && ln -s /opt/python3/bin/idle3 /usr/local/bin/idle \
  && ln -s /opt/python3/bin/pip3 /usr/local/bin/pip \
  && ln -s /opt/python3/bin/pydoc3 /usr/local/bin/pydoc \
  && ln -s /opt/python3/bin/python3 /usr/local/bin/python \
  && ln -s /opt/python3/bin/python-config3 /usr/local/bin/python-config
