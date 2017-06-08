FROM php:5.6-apache

RUN docker-php-ext-install mysqli

# Install needed php extensions: ldap
RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

RUN a2enmod rewrite expires

CMD ["apache2-foreground"]
