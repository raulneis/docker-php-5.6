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

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD php.ini-apache /etc/php/5.6/apache2/php.ini
ADD php.ini-cli /etc/php/5.6/cli/php.ini

RUN a2enmod rewrite headers

# Change www-data user to match the host system UID and GID and chown /var/www
# RUN usermod --non-unique --uid 1000 www-data \
#   && groupmod --non-unique --gid 1000 www-data \
#   && chown -R www-data:www-data /var/www
USER www-data:www-data

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
