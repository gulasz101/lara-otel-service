ARG PHP_VERSION=8.2

FROM ghcr.io/roadrunner-server/roadrunner:2.10.1 AS roadrunner
FROM composer:latest AS composer
FROM php:${PHP_VERSION}-alpine

WORKDIR /app

RUN addgroup -g "1000" -S php \
  && adduser --system --gecos "" --ingroup "php" --uid "1000" php \
  && mkdir /var/run/rr \
  && chown php /var/run/rr

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions \
    sockets \
    zip \
    grpc \
    mbstring \
    zlib \
    ffi \
    redis \
    protobuf \
    opentelemetry

RUN install-php-extensions \
    pdo_pgsql


COPY --from=roadrunner /usr/bin/rr /usr/local/bin/rr
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache \
    bash \
    git \
    zlib

USER php
