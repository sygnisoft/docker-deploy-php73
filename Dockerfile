FROM php:7.3-fpm

WORKDIR /app

RUN apt-get update
RUN apt-get install -y wget libpq-dev git curl libzip-dev zip ssh rsync libxml2-dev nano acl gnupg awscli apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer
RUN docker-php-ext-install pcntl pdo pdo_pgsql sockets bcmath zip
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
