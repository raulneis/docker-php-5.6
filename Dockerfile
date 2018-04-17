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

# ADD .docker/httpd.conf /opt/lampp/etc/httpd.conf
# ADD .docker/httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf
# ADD .docker/php.ini /opt/lampp/etc/php.ini

# RUN mkdir -p /var/www/html

WORKDIR /var/www/html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
