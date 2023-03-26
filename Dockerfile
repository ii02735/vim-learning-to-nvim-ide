FROM alpine:3.17.0

ARG UID=1000
RUN adduser -h /home/noroot -u ${UID} noroot -D

RUN apk update && apk upgrade --available && sync
RUN apk add git neovim
USER noroot
WORKDIR /home/noroot

COPY config /home/noroot/.config
