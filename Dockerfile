FROM ubuntu:latest
LABEL maintainer="docker@public.swineson.me"

# install server
WORKDIR /tmp
RUN wget http://gwan.com/archives/gwan_linux64-bit.tar.bz2 \
    && tar -xjvf gwan_linux64-bit.tar.bz2 \
    && mv gwan_linux64-bit/gwan /usr/local/bin/gwan \
    && chmod +x /usr/local/bin/gwan \
    && mkdir -p /var/www/gwan \
    && cp -r gwan_linux64-bit/* /var/www/gwan \
    && rm -rf /tmp/* \
    && gwan -v

WORKDIR /var/www/gwan

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
	&& ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["gwan"]