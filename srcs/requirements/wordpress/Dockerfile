FROM debian:buster
WORKDIR /var/www/html/
COPY tools/wordpress wordpress
COPY tools/config.sh config.sh
RUN chmod +x config.sh
CMD [ "sh", "config.sh" ]
