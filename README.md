# Drone base image

This is a base image for [drone](https://github.com/drone/drone) based on the [phusion/baseimage](https://github.com/phusion/baseimage-docker).

It currently installs the following:

* wget, build-essential, git, socat, imagemagick (and associated dev packages)
* PostgreSQL client and MySQL client (and associated dev packages)
* xvfb and phantomjs
* nodejs
* ruby-install and chruby
* Ruby 2.2.2
