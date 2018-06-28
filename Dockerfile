FROM php:7.1.3-apache

ENV APACHE_DOCUMENT_ROOT /raccoon/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN echo "deb http://ftp.debian.org/debian $(sed -n 's/^VERSION=.*(\(.*\)).*/\1/p' /etc/os-release)-backports main" >> /etc/apt/sources.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		libjpeg-dev \
		libpng-dev \
		libxml2-dev \
		libzip-dev \
	&& docker-php-ext-install \
		exif \
		gd \
		mysqli \
		opcache \
		soap \
		zip 