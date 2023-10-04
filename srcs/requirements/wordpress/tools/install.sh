#!/bin/sh

sleep 10

cd /var/www/html
mkdir -p wordpress
cd wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
wp config create --dbhost=$BDD_HOST --dbname=$BDD_NAME --dbuser=$BDD_USER --dbpass=$BDD_USER_PASSWORD --allow-root
wp core install --url=fbily.42.fr --title="Inception - fbily" --admin_name=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root

/usr/sbin/php-fpm7.4 -F