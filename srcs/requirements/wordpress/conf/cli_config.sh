#!/bin/bash

sleep 10 #let MariaDB be created

if [ -f /var/www/wordpress/wp-config.php ]
then
    echo "WordPress database already exists"

else
    echo "WordPress configuration ongoing..."
    wp config create \
        --path=/var/www/wordpress \
        --dbname=$WP_NAME \
        --dbuser=$WP_USER \
        --dbpass=$WP_PASSWORD \
        --dbhost=$WP_HOST \
        --dbprefix="wp_" \
        --allow-root

    wp core install \
        --path=/var/www/wordpress \
        --url=$WEBSITE_URL\
        --title="$WEBSITE_TITLE" \
        --admin_name=$ADMIN_NAME \
        --admin_password=$ADMIN_PASSWORD \
        --admin_email=$ADMIN_EMAIL \
        --skip-email \
        --allow-root

    wp user create \
        --path=/var/www/wordpress \
        --user_name=$USER_NAME \
        --user_password=$USER_PASSWORD \
        --user_email=$USER_EMAIL \
        --role=author \
        --skip-email \
        --allow-root


fi

exec /usr/sbin/php-fpm7.4 -F #-F to execute php