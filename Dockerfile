FROM alpine:3.17.0

ARG UID=1000
RUN adduser -h /home/noroot -u ${UID} noroot -D

RUN apk update && apk upgrade --available && sync
RUN apk add git neovim neovim-doc ripgrep # required for grep usage in neovim lua config
# C compiler and musl in addition for compiler (both are required for treesitter's parsers)
# composer and php dependencies for psalm
RUN apk add gcc musl-dev tmux composer php-simplexml php-dom php-tokenizer
# cc1 build-time dependency required for php treesitter's parser
RUN apk add build-base
RUN apk add --update npm
# wget for dependency downloading for MASON
RUN apk add --no-cache wget
USER noroot
WORKDIR /home/noroot

COPY --chown=noroot config /home/noroot/.config

RUN mkdir ~/.local ~/intelephense
COPY licence.txt ~/intelephense

# Don't forget to run ":so" inside of packer.vim !!!

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
