FROM debian:bullseye-slim

#tini = handle zombie processes
RUN apt-get update && apt-get install -y mariadb-server tini

EXPOSE 3306

COPY ./conf/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/mariadb.sh"]

#listen from all IPs
CMD ["mysqld", "--bind-address=0.0.0.0"]