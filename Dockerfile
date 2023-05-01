FROM php:8.1.18-apache as php

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get install nano

WORKDIR /var/www
COPY ./src /var/www
#COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite

ENV PORT=8001
#RUN chmod +x entrypoint.sh
#ENTRYPOINT [ "docker/entrypoint.sh" ]
