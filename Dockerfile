FROM php:7.3-fpm

WORKDIR /app

RUN apt-get update
RUN apt-get install -y wget libpq-dev git curl libzip-dev zip ssh rsync libxml2-dev nano acl gnupg awscli apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator
RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer
RUN docker-php-ext-install pcntl pdo pdo_pgsql sockets bcmath zip
RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis
