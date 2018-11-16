FROM php:7.0-apache

WORKDIR /var/www/html

COPY src/ /var/www/html/

COPY ./docker/default.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install json