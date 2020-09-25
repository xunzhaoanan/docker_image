FROM webdevops/php-nginx:7.4-alpine

LABEL maintainer="tencentcloud"


COPY conf/default.conf /opt/docker/etc/nginx/conf.d
COPY conf/vhost.conf /opt/docker/etc/nginx/vhost.conf
ADD www/code.tar.gz /app/

RUN chown -R www-data /app/*
RUN chgrp -R www-data /app/*



