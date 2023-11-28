#!/bin/bash

# Start MariaDB server
service mariadb start
# Wait for MariaDB to initialize
sleep 5

MYSQLROOTPASS="$MYSQL_ROOT_PASSWORD"
MYSQLDB="$MYSQL_DATABASE"
MYSQLUSER="$MYSQL_USER"
MYSQLPASS="$MYSQL_PASSWORD"

# Create a database (replace "your_database" with the desired database name)
mariadb -e "CREATE DATABASE IF NOT EXISTS $MYSQLDB;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQLUSER'@'%' IDENTIFIED BY '$MYSQLPASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQLDB.* TO '$MYSQLUSER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb -e "SHUTDOWN;"
# exec /usr/sbin/mariadbd

# will wait for the shutdown
sleep 10

# start the mariadb again 
# mariadbd --user=root --bind-address=0.0.0.0 
echo "Ready !"
mysqld --user=mysql --bind-address=0.0.0.0 2>/dev/null

# Keep the script running to keep the container running
