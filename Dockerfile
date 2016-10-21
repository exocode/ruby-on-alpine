# slim puma server Package based on alpine
# for ruby and ruby on rails applications.
# 
FROM alpine:latest

MAINTAINER Jan Jezek<mail@mediatainment-productions.com>

# SET standard language
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# SSL and Transfers
RUN apk add --no-cache openssl curl

# Ruby installation
# disable gem docs by default
RUN echo 'gem: --no-rdoc --no-ri' > /etc/gemrc

# ruby and nokogiri dependencies
RUN apk add --no-cache build-base libxml2-dev libxslt-dev ruby-dev ruby
RUN echo "RUBY VERSION:" && ruby -v

RUN gem install bundler
RUN gem install nokogiri