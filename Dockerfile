# Data Science Tool set in a Container
# docker run -v `pwd`:/data -it appsecco/data-science-toolbox sh

FROM alpine:latest
LABEL MAINTAINER="Madhu Akula"

RUN apk --no-cache add py-pip groff bash bc git curl \
		coreutils imagemagick findutils grep man \
		less parallel p7zip nodejs-lts sudo \
		sed tar tree unrar unzip jq

RUN pip install awscli nose bigmler csvkit && 
    npm install -g cowsay json2csv xml2json-command

COPY scripts/body /usr/local/bin/body
COPY scripts/cols /usr/local/bin/cols
COPY scripts/dseq /usr/local/bin/dseq
COPY scripts/header /usr/local/bin/header
COPY scripts/pbc /usr/local/bin/pbc
COPY scripts/unpack /usr/local/bin/unpack
COPY scripts/Rio /usr/local/bin/Rio
COPY scripts/Rio-scatter /usr/local/bin/Rio-scatter
COPY scripts/sample /usr/local/bin/sample

RUN rm -rf /var/cache/apk/*

WORKDIR /data
