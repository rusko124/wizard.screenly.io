FROM ruby:2.4.1-stretch
ENV LANG C.UTF-8

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update -qq && \
    apt-get install -y build-essential imagemagick optipng

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get install -y nodejs
RUN npm install -g svgo

ADD Gemfile /usr/src/app
ADD Gemfile.lock /usr/src/app

RUN gem install bundle && \
    bundle && \
    bundle install
