FROM php:8.4-fpm

ARG DOCKERUSER 
ARG DOCKERGROUP 
ARG DOCKERUSERID

RUN     useradd -m -u $DOCKERUSERID $DOCKERUSER \
	&& usermod -a -G $DOCKERGROUP $DOCKERUSER 

RUN apt-get update

RUN apt-get install --assume-yes curl wget git zip libpng-dev zlib1g-dev unzip gnupg gnupg2 less cron dirmngr apt-transport-https lsb-release libfreetype6-dev libjpeg62-turbo-dev libjpeg-dev libpng-dev libmcrypt-dev libicu-dev procps libxslt-dev libxml2-dev libsodium-dev libzip-dev gcc g++ make openssh-server librdkafka-dev libpq-dev libonig-dev libcurl4-openssl-dev libicu-dev

RUN pecl install -o -f redis
RUN pecl install mongodb
RUN pecl install rdkafka
RUN rm -rf /tmp/pear

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install -j$(nproc) gd pdo_mysql mysqli bcmath intl zip pcntl xsl sockets soap ftp pdo_pgsql pgsql

RUN pecl install xdebug

RUN docker-php-ext-enable redis gd bcmath intl pdo_mysql mysqli sodium rdkafka ftp

RUN rm -rf /var/lib/apt/lists/*
	
RUN	rm /usr/local/etc/php-fpm.conf \
	&& echo " " >> /usr/local/etc/php-fpm.conf \
	&& echo "[global]" >> /usr/local/etc/php-fpm.conf \
	&& echo "error_log = /var/www/html/logs/phpfpm/error.log" >> /usr/local/etc/php-fpm.conf \
	&& echo "log_level = warning" >> /usr/local/etc/php-fpm.conf \
	&& echo "daemonize = no" >> /usr/local/etc/php-fpm.conf \
	&& echo "[www]" >> /usr/local/etc/php-fpm.conf \
	&& echo "access.log = /var/www/html/logs/phpfpm/access.log" >> /usr/local/etc/php-fpm.conf \
	&& echo "user = $DOCKERUSER" >> /usr/local/etc/php-fpm.conf \
	&& echo "group = $DOCKERGROUP" >> /usr/local/etc/php-fpm.conf \
	&& echo "listen = [::]:9000" >> /usr/local/etc/php-fpm.conf \
	&& echo "clear_env = no" >> /usr/local/etc/php-fpm.conf \
	&& echo "pm = dynamic" >> /usr/local/etc/php-fpm.conf \
	&& echo "pm.max_children = 10" >> /usr/local/etc/php-fpm.conf \
	&& echo "pm.start_servers = 10" >> /usr/local/etc/php-fpm.conf \
	&& echo "pm.min_spare_servers = 10" >> /usr/local/etc/php-fpm.conf \
	&& echo "pm.max_spare_servers = 10" >> /usr/local/etc/php-fpm.conf
	
RUN	rm /usr/local/etc/php-fpm.d/www.conf \
	&& echo " " >> /usr/local/etc/php-fpm.d/www.conf \	
	&& echo "[www]" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "user = $DOCKERUSER" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "group = $DOCKERGROUP" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "listen = 127.0.0.1:9000" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "pm = dynamic" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "pm.max_children = 5" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "pm.start_servers = 2" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "pm.min_spare_servers = 1" >> /usr/local/etc/php-fpm.d/www.conf \
	&& echo "pm.max_spare_servers = 3" >> /usr/local/etc/php-fpm.d/www.conf

RUN 	echo " " >> /usr/local/etc/php/php.ini \
	&& echo "error_reporting=E_ALL" >> /usr/local/etc/php/php.ini \
	&& echo "memory_limit = 750G" >> /usr/local/etc/php/php.ini \
	&& echo "max_execution_time = 1800" >> /usr/local/etc/php/php.ini \
	&& echo "zlib.output_compression = Off" >> /usr/local/etc/php/php.ini \
	&& echo "cgi.fix_pathinfo = 0" >> /usr/local/etc/php/php.ini \
	&& echo "date.timezone = America/New_York" >> /usr/local/etc/php/php.ini \
	&& echo "upload_max_filesize = 20M" >> /usr/local/etc/php/php.ini \
	&& echo "post_max_size = 20M" >> /usr/local/etc/php/php.ini

RUN	echo " " >> /usr/local/etc/php/conf.d/xdebug.ini \	
	&& echo "[xdebug]" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.mode=develop,debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.client_host=host.docker.internal"	 >> /usr/local/etc/php/conf.d/xdebug.ini \
	&& echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.log=/var/www/html/logs/xdebug/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.client_port=9001" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN	echo " " >> /usr/local/etc/php/conf.d/opcache.ini \	
	&& echo "[opcache]" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.revalidate_freq=0" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.validate_timestamps=${PHP_OPCACHE_VALIDATE_TIMESTAMPS}" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.max_accelerated_files=${PHP_OPCACHE_MAX_ACCELERATED_FILES}" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.memory_consumption=${PHP_OPCACHE_MEMORY_CONSUMPTION}" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.max_wasted_percentage=${PHP_OPCACHE_MAX_WASTED_PERCENTAGE}" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.interned_strings_buffer=16" >> /usr/local/etc/php/conf.d/opcache.ini \
	&& echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/conf.d/opcache.ini

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod -R a+rx wp-cli.phar

RUN mv wp-cli.phar /usr/bin/wp-cli

RUN curl -v https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pear config-set php_ini /usr/local/etc/php/php.ini

RUN wget https://files.magerun.net/n98-magerun2.phar --no-check-certificate && chmod +x ./n98-magerun2.phar && mv ./n98-magerun2.phar /usr/bin/n98

USER $DOCKERUSER

RUN curl -sS https://accounts.magento.cloud/cli/installer | php

RUN composer global require laravel/installer
