# Slim ruby server package based on latest alpine image
# Good for for Ruby and Ruby on rails applications.
#
# nokogiri, openssl, imagemagick and curl pre installed

FROM alpine:3.7

MAINTAINER Jan Jezek<mail@jezekjan.com>

# Set version
ENV RUBY_VERSION 2.4.4-r0

# Set standard language
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# SSL and Transfers
RUN apk add --no-cache openssl curl
RUN apk add --no-cache git

# default settings for gems
 RUN echo "gem: --no-rdoc --no-ri \nupdate: --no-rdoc --no-ri" > /etc/.gemrc

# ruby, nokogiri and useful standard stuff
RUN apk add --no-cache build-base \
            libxml2-dev \
            gcc \
            libxslt-dev \
            nodejs \
            libstdc++ \
            tzdata \
            python python-dev \
            libffi-dev \
	  && rm -rf /var/cache/apk/*

RUN apk add --no-cache ruby-dev ruby=$RUBY_VERSION ruby-irb ruby-json ruby-rake ruby-bigdecimal ruby-io-console
RUN apk add --no-cache

RUN echo "RUBY VERSION:" && ruby -v

# We removed that, because you can enable it in your app image to prevent version conflicts.
# RUN gem update --system
# RUN gem install bundler
