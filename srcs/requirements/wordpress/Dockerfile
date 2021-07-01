FROM debian:buster
WORKDIR /var/www/
COPY tools/wordpress wp
COPY tools/config.sh config.sh
RUN chmod +x config.sh
CMD [ "sh", "config.sh" ]
