FROM rts2271/phpfpm74:v1.0.0

ARG ARG_USERPASS
ARG ARG_DOMAIN
ARG ARG_APP
ARG ARG_USER
ARG ARG_USERID
ARG ARG_GROUP

RUN useradd -m -u $ARG_USERID $ARG_USER \
	&& usermod -a -G sudo $ARG_USER

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
