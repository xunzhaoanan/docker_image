FROM webdevops/php-nginx:7.4

LABEL maintainer="tencentcloud"


COPY conf/dzx-nginx.conf /opt/docker/etc/nginx/conf.d
COPY conf/vhost.conf /opt/docker/etc/nginx/vhost.conf
ADD www/dzx_code.tar.gz /app/

ADD run.sh /run.sh
RUN chmod 775 /run.sh

CMD ["/run.sh"]


