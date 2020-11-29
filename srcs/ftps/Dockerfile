FROM alpine

RUN apk update && apk upgrade
RUN apk add vsftpd openssl
RUN echo 'root:root' | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ftps.key -out /etc/ssl/private/ftps.crt -subj "/C=RU/ST=Russia/L=Moscow/O=School/OU=ddraco/CN=localhost"

COPY srcs/vsftpd.conf		/etc/vsftpd/vsftp_ftps.conf
COPY srcs/setup.sh			/tmp/

EXPOSE 21

CMD ["sh", "/tmp/setup.sh"]