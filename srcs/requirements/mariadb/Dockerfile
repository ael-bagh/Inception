FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install -y ufw iptables

RUN ufw allow 3306

COPY tools/setup.sh setup.sh
COPY tools/wp_db.sql /wp.sql
RUN chmod +x setup.sh
COPY tools/conf /conf
CMD ["sh", "setup.sh"]