FROM php:5.6-apache
MAINTAINER Manuel Bahamondez "manuel@bahamondez.com"
WORKDIR /usr/src
RUN apt-get update && apt-get install -y wget unzip libpq-dev && apt-get clean
RUN docker-php-ext-install pgsql mbstring
RUN wget https://tt-rss.org/gitlab/fox/tt-rss/repository/archive.zip?ref=master -O archive.zip; unzip archive.zip; rm -f archive.zip
RUN mv tt-rss.git /var/www/html/ttrss
RUN echo "Hello World!" > /var/www/html/index.html
COPY config.php /var/www/html/ttrss/config.php
RUN chown -R www-data:www-data /var/www/html/ttrss
