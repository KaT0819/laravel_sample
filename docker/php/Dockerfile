FROM php:7.2-fpm
# COPY php.ini /usr/local/etc/php/

RUN apt update \
  && apt install -y zlib1g-dev mariadb-client \
  && docker-php-ext-install zip pdo_mysql

#Composer install
COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV COMPOSER_HOME /composer

ENV PATH $PATH:/composer/vendor/bin


WORKDIR /var/www/sample

RUN composer global require "laravel/installer"


RUN curl -L git.io/nodebrew | perl - setup
RUN export PATH=$HOME/.nodebrew/current/bin:$PATH
RUN echo "export PATH=$PATH:$HOME/.nodebrew/current/bin" >> ~/.bash_profile

# RUN nodebrew setup
# RUN export PATH=$PATH:$HOME/.nodebrew/current/bin
# RUN nodebrew install-binary v8.9.3
# RUN nodebrew use v8.9.3

# RUN npm install
# RUN npm install sass


RUN chmod 777 bootstrap/cache \
  && chmod 777 storage/app/public \
  && chmod 777 storage/framework/cache \
  && chmod 777 storage/framework/sessions \
  && chmod 777 storage/framework/views \
  && chmod 777 storage/logs
