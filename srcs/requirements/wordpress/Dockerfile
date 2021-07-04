FROM debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt -y install php7.3-fpm php7.3-common php7.3-mysql php
COPY tools/wordpress wp
COPY tools/config.sh config.sh
COPY tools/www.conf www.conf
RUN chmod +x config.sh
CMD [ "sh", "config.sh" ]
