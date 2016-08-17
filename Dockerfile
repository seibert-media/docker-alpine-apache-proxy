FROM alpine

MAINTAINER //SEIBERT/MEDIA GmbH <docker@seibert-media.net>

RUN set -x \
    && apk update && apk upgrade \
    && apk add apache2 apache2-proxy

RUN set -x \
    && sed -i 's/^LoadModule proxy_fdpass_module/#LoadModule proxy_fdpass_module/' /etc/apache2/conf.d/proxy.conf \
    && sed -i "s/^#LoadModule slotmem_shm_module/LoadModule slotmem_shm_module/" /etc/apache2/httpd.conf \
    && sed -i "s/^#LoadModule rewrite_module/LoadModule rewrite_module/" /etc/apache2/httpd.conf \
    && echo "IncludeOptional /etc/apache2/vhost.d/*.conf" >> /etc/apache2/httpd.conf \
    && mkdir /run/apache2 /etc/apache2/vhost.d \
    && ln -sf /proc/self/fd/1 /var/log/apache2/access.log \
    && ln -sf /proc/self/fd/1 /var/log/apache2/error.log

CMD httpd -D FOREGROUND
