FROM node:14-alpine

WORKDIR /build

COPY package.json /build/

RUN apk --update upgrade
RUN apk add libpng-dev automake autoconf make libtool \
    g++ imagemagick nasm
RUN npm install
