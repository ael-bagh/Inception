FROM debian:buster
COPY tools/wordpress wordpress
RUN mv /wordpress/* /var/www/html/
COPY tools/config.sh config.sh
RUN chmod +x config.sh
CMD [ "sh", "config.sh" ]
