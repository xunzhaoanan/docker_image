FROM xunzhaoanan/onetouch-nginx:v1.0

LABEL maintainer="tencentcloud"

RUN mkdir /onetouch_template
RUN mkdir /onetouch_work

ADD onetouch_template/temp.tar.gz /onetouch_template/
ADD onetouch_template/touch.tar.gz /app/

RUN chmod -R 777 /onetouch_template
RUN chmod -R 777 /onetouch_work



