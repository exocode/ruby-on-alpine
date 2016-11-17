# slim ruby server Package based on alpine
# for ruby and ruby on rails applications.
# 
# nokogiri, openssl and curl pre installed

FROM alpine:latest

MAINTAINER Jan Jezek<mail@mediatainment-productions.com>

# SET standard language
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# SSL and Transfers
RUN apk add --no-cache openssl curl
RUN apk add --no-cache git

# disable gem docs by default
RUN echo 'gem: --no-rdoc --no-ri' > /etc/gemrc

# ruby, nokogiri and useful standard stuff
RUN apk add --no-cache build-base libxml2-dev gcc libxslt-dev nodejs libstdc++ tzdata python python-dev libffi-dev \
	  && rm -rf /var/cache/apk/*
RUN apk add --no-cache ruby-dev ruby ruby-irb ruby-json ruby-rake ruby-bigdecimal ruby-io-console 

RUN apk add --no-cache 
RUN echo "RUBY VERSION:" && ruby -v

RUN gem update --system
RUN gem install bundler
