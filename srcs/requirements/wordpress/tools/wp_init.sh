#!/usr/bin/env bash

mkdir -p /var/www/html /var/run/php/

if [ ! -e /var/www/html/wordpress ]; then

	# Download Wordpress
	echo "Downloading Wordpress..."
	wget -O /tmp/latest.tar.gz --no-check-certificate https://wordpress.org/latest.tar.gz;
	tar -xvzf /tmp/latest.tar.gz -C /var/www/html/;

	# wp-config.php
	echo "Generating wp-config.php..."
	cat <<EOF > /var/www/html/wordpress/wp-config.php
<?php
define( 'DB_NAME', '$DB_NAME' );
define( 'DB_USER', '$DB_USER' );
define( 'DB_PASSWORD', '$DB_USER_PWD' );
define( 'DB_HOST', '$DB_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
$(wget -qO- --no-check-certificate https://api.wordpress.org/secret-key/1.1/salt/)
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
EOF

	cat /var/www/html/wordpress/wp-config.php

	wp-cli core install --url=https://$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email="$WP_ADMIN_MAIL" --allow-root --path=/var/www/html/wordpress
	wp-cli user create $WP_USER $WP_USER_MAIL --role=editor --user_pass="$WP_USER_PWD" --allow-root --path=/var/www/html/wordpress
fi

echo "Starting php-fpm..."
php-fpm7.4 --nodaemonize
