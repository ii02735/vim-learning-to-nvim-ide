FROM alpine:3.17.0

ARG UID=1000
RUN adduser -h /home/noroot -u ${UID} noroot -D

RUN apk update && apk upgrade --available && sync
RUN apk add git neovim neovim-doc
USER noroot
WORKDIR /home/noroot

COPY --chown=noroot config /home/noroot/.config

RUN mkdir ~/.local

# Don't forget to run ":so" inside of packer.vim !!!

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim