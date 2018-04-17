FROM ubuntu:16.04
MAINTAINER @raulneis <raulneis@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update

RUN apt-get install -y php5.6
RUN apt-get install -y php5.6-mbstring
RUN apt-get install -y php5.6-mcrypt
RUN apt-get install -y php5.6-mysql
RUN apt-get install -y php5.6-xml
RUN apt-get install -y php-xdebug

ADD php.ini-apache /etc/php/5.6/apache2/php.ini
ADD php.ini-cli /etc/php/5.6/cli/php.ini

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
