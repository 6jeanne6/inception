FROM	debian:bullseye

RUN 	apk update \
		bash \
		mariadb-client \
		libpng-dev \
    	libjpeg-turbo-dev \
    	libwebp-dev \
    	freetype-dev \
    	libzip-dev \
    	zip \
    	unzip \
    	&& docker-php-ext-configure gd \
			--with-freetype \
        	--with-jpeg \
        	--with-webp \
    	&& docker-php-ext-install pdo pdo_mysql gd zip

RUN		chown -R www-data:www-data /var/www/html

COPY	

RUN		

EXPOSE	9000

ENTRYPOINT ["php-fpm"]