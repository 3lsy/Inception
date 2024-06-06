FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

# Update & Install (php)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends php php-fpm php-opcache \
    php-gd php-mysqli php-curl php-mbstring php-json php-phar wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download & Install WP-CLI
RUN wget --no-check-certificate -O /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /tmp/wp-cli.phar \
    && mv /tmp/wp-cli.phar /usr/local/bin/wp-cli

# Copy www.conf to php-fpm
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wp_init.sh /tmp/

RUN chmod +x /tmp/wp_init.sh

ENTRYPOINT ["/tmp/wp_init.sh"]
