FROM debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt -y install php7.3-fpm php7.3-common php7.3-mysql
COPY tools/wordpress /wordpress
COPY tools/config.sh /config.sh
CMD [ "sh", "config.sh" ]
