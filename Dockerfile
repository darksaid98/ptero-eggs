FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx git imagemagick python3 diffutils openrc ffmpeg lua5.1
RUN apk add php php-xml php-exif php-fpm php-cgi php-session php-soap php-openssl php-gmp php-pdo_odbc php-json php-dom php-pdo php-zip php-zlib php-intl php-mysqli php-sqlite3 php-pdo_pgsql php-bcmath php-gd php-odbc php-pdo_mysql php-pdo_sqlite php-gettext php-xmlreader php-bz2 php-iconv php-pdo_dblib php-curl php-ctype php-phar php-fileinfo php-mbstring php-tokenizer php-simplexml php-apcu
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
