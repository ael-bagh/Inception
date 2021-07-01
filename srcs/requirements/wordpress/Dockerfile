FROM debian:buster
COPY tools/wordpress wordpress
RUN mv /wordpress/* /var/www/
COPY tools/config.sh config.sh
RUN chown -R www-data /var/www/
RUN chmod +x config.sh
CMD [ "sh", "config.sh" ]
