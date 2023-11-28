FROM    debian:12
RUN apt-get update && apt-get upgrade
RUN apt-get -y install wget
RUN apt-get install -y php-fpm\
    php-mysql\
    mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
EXPOSE 9000
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
# COPY wp-config.php /var/www/wordpress
# CMD ["/usr/sbin/php-fpm8.2", "-F"]
COPY wpsetup.sh /

CMD ["sh", "wpsetup.sh"]