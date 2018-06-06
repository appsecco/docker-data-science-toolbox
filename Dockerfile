# Data Science Tool set in a Container
# docker run -v `pwd`:/data -it appsecco/data-science-toolbox sh

FROM alpine:latest
LABEL MAINTAINER="Madhu Akula"

RUN apk --no-cache add py-pip groff bash bc git curl \
		coreutils imagemagick findutils grep man \
		less parallel p7zip nodejs-lts sudo \
		sed tar tree unrar unzip jq

RUN pip install awscli nose bigmler csvkit \
   && npm install -g cowsay json2csv xml2json-command

COPY scripts/* /usr/local/bin/

RUN rm -rf /var/cache/apk/*

WORKDIR /data
