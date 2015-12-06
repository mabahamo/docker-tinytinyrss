FROM php:5.6-apache
MAINTAINER Manuel Bahamondez "manuel@bahamondez.com"
WORKDIR /usr/src
RUN apt-get update && apt-get install -y wget unzip && apt-get clean
RUN wget https://tt-rss.org/gitlab/fox/tt-rss/repository/archive.zip?ref=master -O archive.zip; unzip archive.zip; rm -f archive.zip
RUN mv tt-rss.git /var/www/html/ttrss
RUN echo "Hello World!" > /var/www/html/index.html
RUN chown -R www-data:www-data /var/www/html/ttrss
