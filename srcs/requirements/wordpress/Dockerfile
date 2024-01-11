FROM debian:11

RUN apt update && apt upgrade -y && apt install -y \
    php \
    php-mysql \
    php-fpm \
    mariadb-client \
    curl \
    wget

RUN service php7.4-fpm start

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html

WORKDIR  /var/www/html


COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000:9000

COPY ./tools/wordpress.sh .

RUN chmod +x ./wordpress.sh


CMD ["./wordpress.sh"]