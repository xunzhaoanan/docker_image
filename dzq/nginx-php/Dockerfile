FROM webdevops/php-nginx:7.4-alpine

LABEL maintainer="tencentcloud"


COPY conf/default.conf /opt/docker/etc/nginx/conf.d
COPY conf/vhost.conf /opt/docker/etc/nginx/vhost.conf
ADD www/code.tar.gz /app/

ADD run.sh /
RUN chmod 775 /run.sh
RUN chown -R www-data /app/*
RUN chgrp -R www-data /app/*
RUN chmod -R 777 /app/storage

#ENTRYPOINT ["sh","/run.sh"]


