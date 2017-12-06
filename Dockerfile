FROM ruby:2.1
MAINTAINER crisb@crisb-DUT.github.io

RUN apt-get update \
  && apt-get install -y \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

ADD ./ /env
WORKDIR /env
RUN bundle install

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]

