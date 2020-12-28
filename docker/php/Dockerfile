FROM php:7.2-fpm
COPY php.ini /usr/local/etc/php/

RUN apt-get update \
  && apt-get install -y zlib1g-dev mariadb-client \
  && docker-php-ext-install zip pdo_mysql

#Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /composer

ENV PATH $PATH:/composer/vendor/bin


WORKDIR /var/www

RUN composer global require "laravel/installer"


RUN curl -L git.io/nodebrew | perl - setup
RUN export PATH=$HOME/.nodebrew/current/bin:$PATH
RUN echo "export PATH=$PATH:$HOME/.nodebrew/current/bin" >> ~/.bash_profile
RUN nodebrew setup
RUN export PATH=$PATH:$HOME/.nodebrew/current/bin
RUN nodebrew install-binary v8.9.3
RUN nodebrew use v8.9.3
WORKDIR ./sample
RUN npm install
RUN npm install sass
