FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

# Install NGINX and OpenSSL
# - NGINX is a web server that will serve the web pages
# - OpenSSL is used to generate SSL certificates (encryption keys)
#     to secure the connection between the client and the server
RUN apt-get update && apt-get install -y \
	nginx openssl php-fpm && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# apt-get clean and rm -rf /var/lib/apt/lists/*
#   are used to clean up the image and reduce its size

# Generate SSL certificate
# - Generate a private key: for encryption
# - Generate a self-signed certificate: to verify the server's identity
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=echavez-.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/php /var/www/html && php-fpm7.4

CMD ["nginx", "-g", "daemon off;"]