FROM debian:11

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN openssl req -new -x509 -nodes  -keyout /etc/nginx/private.key -out /etc/nginx/crs.crs -subj "/C=US/ST=Virginia/l=Washington/O=network42/CN=mserrouk.42.fr"

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx" ,"-g", "daemon off;"]