ARG PY_VERSION=3.7-alpine3.9
FROM armv6/python:$PY_VERSION as oled-base

COPY qemu-arm-static /usr/bin

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

RUN pip3 install spidev && pip3 install --no-cache-dir \
	requests \
	six \
	urllib3 \
	Adafruit-SSD1306 \
	Pillow \
	RPi.GPIO \
	gpiozero

RUN apk del .build-deps && rm -rf /var/cache/apk/*
