#!/bin/bash

sleep 10
if [ -f ./wp-config.php ]
	echo "e";
then
	wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz
	wp core download --allow-root
	wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=${MARIADB_HOST} --extra-php --path='/var/www/html'
	wp core install --allow-root --url=$WP_URL --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
	wp user create --allow-root $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD
fi
php-fpm7.4 -F