FROM debian:11

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY ./conf ./etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setup.sh /

RUN chmod +x /setup.sh

EXPOSE 3306

CMD service mariadb start && ./setup.sh && mysqld_safe