FROM debian:buster
WORKDIR /var/www/html/
COPY tools/wordpress wordpress
COPY tools/config.sh /config.sh
CMD [ "sh", "config.sh" ]
