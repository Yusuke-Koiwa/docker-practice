FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

RUN mkdir /webapp
WORKDIR /webapp

ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /webapp

RUN mkdir -p tmp/sockets