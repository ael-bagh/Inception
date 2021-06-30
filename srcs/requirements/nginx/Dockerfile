#nginx install https://linuxize.com/post/how-to-install-nginx-on-debian-10/
FROM debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt install nginx -y
RUN apt install openssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=MA/ST=Rhamna/L=Benguerir/O=1337 Network/OU=IT Student/CN=ael-bagh@student.1337.ma"
COPY tools/default /etc/nginx/sites-available/
CMD ["nginx", "-g", "daemon off;"]
