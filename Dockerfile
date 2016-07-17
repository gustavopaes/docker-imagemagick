FROM debian:jessie

MAINTAINER Gustavo Paes "gustavo.paes@gmail.com"

ENV ZLIB_VERSION 1.2.8
ENV IMAGEMAGICK_VERSION 7.0.2-4
ENV LIBPNG_VERSION 1.6.23
ENV LIBJPEG_VERSION 6b
ENV LIBJPEG_RELEASE r6

## Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      wget \
      pkg-config \
      build-essential \
      libpng12-0 \
      libpng-dev \
      libjpeg62-turbo \
      libjpeg-turbo-progs \
      libjpeg62-turbo-dev

## Download imagemagick
RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz
RUN tar xzf ImageMagick.tar.gz && rm -rf ImageMagick.tar.gz
RUN cd ImageMagick-${IMAGEMAGICK_VERSION} && \
      ./configure --prefix=/usr/local && \
      make && make install

RUN ldconfig /usr/local/lib