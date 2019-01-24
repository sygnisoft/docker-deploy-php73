FROM php:7.3-fpm

WORKDIR /app

RUN apt-get update
RUN apt-get install -y wget libpq-dev
RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer
RUN docker-php-ext-install pcntl pdo pdo_pgsql sockets bcmath
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
