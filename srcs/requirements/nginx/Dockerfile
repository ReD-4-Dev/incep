FROM	debian:12
RUN	apt-get update && apt-get install -y nginx && apt-get install -y openssl
# RUN	rm -f /etc/nginx/nginx.conf 	
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/reda.crt \
    -keyout /etc/nginx/ssl/reda.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=rel-mham.42.fr/UID=rel-mham"

COPY	/conf/default /etc/nginx/sites-enabled/default
RUN chown -R root:root /var/www/html
# RUN chown 777 /var/www/html
# RUN chmod -R 755 /var/www/html
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
