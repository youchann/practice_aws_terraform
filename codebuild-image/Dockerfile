FROM --platform=linux/amd64 docker:20.10.17-dind-alpine3.16

RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main add \
    icu-libs \
    &&apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community add \
    # Current packages don't exist in other repositories
    libavif \
    && apk add --no-cache --allow-untrusted gnu-libiconv \
    # Packages
    tini \
    php81 \
    php81-dev \
    php81-common \
    php81-gd \
    php81-xmlreader \
    php81-bcmath \
    php81-ctype \
    php81-curl \
    php81-exif \
    php81-iconv \
    php81-intl \
    php81-mbstring \
    php81-opcache \
    php81-openssl \
    php81-pcntl \
    php81-phar \
    php81-session \
    php81-xml \
    php81-xsl \
    php81-zip \
    php81-zlib \
    php81-dom \
    php81-fpm \
    php81-sodium \
    php81-pdo php81-json php81-mysqlnd php81-pear\
    php81-tokenizer \
    php81-fileinfo \
    php81-xmlwriter \
    php81-mysqli \
    php81-pdo_mysql\
    # Iconv Fix
    php81-pecl-apcu \
    && ln -s /usr/bin/php81 /usr/bin/php

RUN apk add --no-cache aws-cli git bash

RUN wget https://getcomposer.org/composer-stable.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer

ENV TZ Asia/Tokyo