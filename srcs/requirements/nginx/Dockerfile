#OS
FROM  debian:bullseye-slim

#update & install applications
RUN		apt-get update -y && \
		apt-get install -y nginx \
		openssl

#SSL/TLS config
RUN     mkdir -p /etc/nginx/ssl
COPY    /conf/nginx.conf /etc/nginx/nginx.conf

#rsa:2048 = 2048-bits key
#nodes = no password on key
#subj = define certificate info
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/nginx.key \
		-out /etc/nginx/ssl/nginx.crt \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=jewu.42.fr/UID=jewu";

#where HTML pages are stored
RUN     chmod 755 /var/www/html

#www-data = NGINX user
RUN     chown -R www-data:www-data /var/www/html

#listening to port

#launch nginx, main process must not stop
CMD  ["nginx", "-g", "daemon off;"]
