DIR="/var/www/wordpress/";
apt-get update && apt-get upgrade -y
apt -y install php7.3-fpm php7.3-common php7.3-mysql
#https://www.cyberciti.biz/faq/linux-unix-shell-check-if-directory-empty
#check if wordpress directory exists
if [ "$(ls -A $DIR)" ]; then
echo "$DIR isn't empty running php-fpm in the foreground"
else
echo "$DIR is Empty \n Copying and modifying wordpress"
cp -r wp/* wordpress
chown -R www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress/
#replace necessary config using sed read about how it works here https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/
sed -i 's/database_name_here/'$DBNAME'/g' /var/www/wordpress/wp_config.php
sed -i 's/username_here/'$DBUSER'/g' /var/www/wordpress/wp_config.php
sed -i 's/password_here/'$DBPASS'/g' /var/www/wordpress/wp_config.php
fi
#run php-fpm in the foreground so it could be PID 1 in a docker container.
#solution from here https://stackoverflow.com/questions/37313780/how-can-i-start-php-fpm-in-a-docker-container-by-default/44409813
#-F, --nodaemonize
      #force to stay in foreground, and ignore daemonize option from config file
#-R, --allow-to-run-as-root
      #Allow pool to run as root (disabled by default)
service php7.3-fpm start
service php7.3-fpm stop
php7.3-fpm -F -R

