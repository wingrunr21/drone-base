FROM phusion/baseimage
MAINTAINER Stafford Brunk <stafford.brunk@gmail.com>

RUN locale-gen --no-purge en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get upgrade -y

# Base
RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y socat
RUN apt-get install -y imagemagick libmagickwand-dev

# DB Clients
RUN apt-get install -y postgresql-client libpq-dev
RUN apt-get install -y mysql-client libmysqlclient-dev

# Frontend Testing
RUN apt-get install -y xvfb phantomjs

# Node/Ruby
RUN apt-get install -y nodejs
RUN apt-get install -y wget
WORKDIR /opt
RUN wget -O ruby-install-0.4.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.3.tar.gz
RUN tar -xzvf ruby-install-0.4.3.tar.gz && rm ruby-install-0.4.3.tar.gz
RUN wget -O chruby-0.3.8.tar.gz https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz
RUN tar -xzvf chruby-0.3.8.tar.gz && rm chruby-0.3.8.tar.gz
WORKDIR /opt/ruby-install-0.4.3
RUN make install
WORKDIR /opt/chruby-0.3.8
RUN make install
WORKDIR /opt
RUN rm -rf ruby-install-0.4.3 chruby-0.3.8
WORKDIR /
ADD chruby.sh /etc/profile.d/
RUN ruby-install ruby 2.1.2
