FROM webdevops/php-nginx-dev:7.4

LABEL maintainer="tencentcloud"


COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/dzx-nginx.conf /opt/docker/etc/nginx/conf.d
COPY conf/10-php.conf /opt/docker/etc/nginx/conf.d
COPY www/* /app/


