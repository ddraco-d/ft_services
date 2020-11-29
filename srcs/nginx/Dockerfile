FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor && echo "root:root" | chpasswd

WORKDIR /var/www/

COPY ./srcs/localhost /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY srcs/sshd_config /etc/ssh/
COPY srcs/ .

RUN mkdir /etc/nginx/ssl
RUN mkdir -p /run/nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=RU/ST=Russia/L=Moscow/O=School/OU=ddraco/CN=localhost"

EXPOSE 80 443

CMD ["sh", "start.sh"]