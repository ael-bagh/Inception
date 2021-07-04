#!/bin/bash
mv /conf /etc/mysql/mariadb.conf.d/50-server.cnf
mysql_install_db --user=mysql --datadir=/var/lib/mysql/
if [ "$(ls -A /var/lib/mysql/${DBNAME})" ]; then
echo "Directory isnt empty"
else
service mysql start
mysql -u root -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}'"
mysql -u root -e "CREATE DATABASE ${DBNAME};use ${DBNAME}"
mysql -u root -e "use ${DBNAME};GRANT ALL PRIVILEGES ON * TO '${DBUSER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root inception < /wp.sql
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DBROOT}';"
fi
echo "Running mariadb in the foreground"
mysqld_safe --datadir='/var/lib/mysql/'
