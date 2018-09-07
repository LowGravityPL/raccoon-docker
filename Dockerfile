FROM ubuntu:18.04

EXPOSE 80

# ENV APACHE_DOCUMENT_ROOT /raccoon/public

RUN echo "deb [trusted=yes] http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" >> /etc/apt/sources.list \
	&& echo "deb [trusted=yes] http://mirror.klaus-uwe.me/mariadb/repo/10.3/ubuntu bionic main" >> /etc/apt/sources.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
		libjpeg-dev \
		libpng-dev \
		libxml2-dev \
		libzip-dev \
		gettext \
		curl \
		ssl-cert \
		ca-certificates \
		apache2 \
		libapache2-mod-php7.1 \
		php7.1 \
		php7.1-gd \
		php7.1-mysqli \
		php7.1-soap \
		php7.1-zip \
		php7.1-xml \
		php7.1-mbstring \
		php7.1-curl \
		mariadb-server-10.3 \
		mariadb-client-10.3

RUN curl -O https://getcomposer.org/composer.phar \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod +x /usr/local/bin/composer

RUN service mysql start

COPY ./apache2-foreground /usr/bin/

RUN chmod +x /usr/bin/apache2-foreground

CMD ["apache2-foreground"]

# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf