
sleep 25

CONFIG_FILE=wp-config.php
cd /var/www/wordpress
sleep 1
cp wp-config-sample.php wp-config.php
# # Update database settings
sed -i "s/votre_nom_de_bdd/$MYSQL_DATABASE/" "$CONFIG_FILE"
sed -i "s/votre_utilisateur_de_bdd/$MYSQL_USER/" "$CONFIG_FILE"
sed -i "s/votre_mdp_de_bdd/$MYSQL_PASSWORD/" "$CONFIG_FILE"
sed -i "s/localhost/mariadb/" "$CONFIG_FILE"


# installation wp-cli

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
echo "creating admin user ... "

wp core install --url="https://localhost"\
                --title="a7senn Site f l3alam" \
                --admin_user="$WP_ADMIN_USER" \
                --admin_password="$WP_ADMIN_PASSWORD" \
                --admin_email="$WP_ADMIN_EMAIL" --allow-root

# echo "Creating regular user..."

wp user create "$REGULAR_USER" "$REGULAR_EMAIL" --role=editor --user_pass="$REGULAR_PASSWORD" --allow-root
echo "WordPress configuration updated successfully."
sleep 3
/usr/sbin/php-fpm8.2 -F