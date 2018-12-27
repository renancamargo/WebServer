############################################################
# Dockerfile to PHP 7
# Based on Debian jessie
############################################################

# Set the base image 
#FROM php:7.0-apache
FROM php:5.6.39-apache-jessie

# File Author / Maintainer
MAINTAINER Renan Camargo

# Install extensions mysql
RUN docker-php-ext-install mysqli

# Install extensions ldap
RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

# Enable mod rewrite
RUN a2enmod rewrite
