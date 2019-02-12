ARG PY_VERSION=3.7-alpine3.9
FROM python:$PY_VERSION as oled-base

WORKDIR /root/
# Setup timezone
ENV TZ=America/Argentina/Cordoba
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apk add --no-cache --virtual .build-deps build-base gcc musl-dev linux-headers

RUN pip3 install spidev

COPY ./requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

RUN apk del .build-deps gcc musl-dev

WORKDIR /usr/src/