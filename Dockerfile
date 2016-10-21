# slimmest possible Linux Package with ruby and puma as server
FROM alpine:latest

MAINTAINER Jan Jezek<mail@mediatainment-productions.com>

# That will install ruby 
# running first "apk update" 
# and then rm -rf /var/cache/apk/*

RUN apk --no-cache add curl
RUN apk --no-cache add ruby

RUN echo "RUBY VERSION:" && ruby -v

RUN gem install bundler --no-document
