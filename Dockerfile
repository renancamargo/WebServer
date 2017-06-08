FROM php:5.6-apache

RUN docker-php-ext-install mysqli php5-ldap

RUN a2enmod rewrite expires

CMD ["apache2-foreground"]
