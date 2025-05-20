FROM	debian:bullseye

RUN 	apk update && apk upgrade && apk add \
RUN		apt-get -y install nginx

RUN		rm -f /etc/nginx/nginx.conf

COPY	/conf/nginx.conf /etc/nginx/nginx.conf
COPY	scripts/setup_nginx.sh /setup_nginx.sh

RUN		chmod -R +x /setup_nginx.sh

EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off"]