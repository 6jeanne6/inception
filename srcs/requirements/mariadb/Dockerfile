FROM	debian:bullseye

RUN 	apk update && apk upgrade && apk add \

RUN		

COPY	./conf/init.sql /docker-entrypoint-initdb.d/init.sql
COPY	/tools/entrypoint.sh /entrypoint.sh

RUN		chmod +x /entrypoint.sh

EXPOSE	3306

ENTRYPOINT ["/entrypoint.sh"]