FROM php:7-fpm

SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

ENV COMPOSER_ALLOW_SUPERUSER=1 \
  COMPOSER_HOME=/composer

COPY --from=composer:1.10 /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y \
  git \
  libicu-dev \
  libonig-dev \
  libzip-dev \
  unzip \
  vim && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  docker-php-ext-install intl pdo_mysql zip bcmath

RUN pecl install xdebug

COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d

# node
RUN apt-get -y update
RUN apt-get install -y \
  curl \
  gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g

WORKDIR /var/www/

RUN npm install
