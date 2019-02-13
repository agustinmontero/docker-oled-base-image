ARG PY_VERSION=3.7-alpine3.9
FROM python:$PY_VERSION as oled-base

WORKDIR /root/
# Setup timezone
ARG TZ=America/Argentina/Cordoba
RUN TZ=$TZ ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone

RUN apk update && apk add --no-cache --virtual .build-deps \
	build-base \
	gcc \
	musl-dev \
	linux-headers \
	zlib-dev \
	&& apk add jpeg-dev

COPY ./requirements.txt ./
RUN pip3 install spidev && pip3 install --no-cache-dir -r requirements.txt

RUN apk del .build-deps && rm -rf /var/cache/apk/*
