ARG RUBY_VERSION=latest

FROM ruby:${RUBY_VERSION}

ENV LANG C.UTF-8

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    wget \
    ca-certificates \
    openssl \
    default-mysql-client \
  && rm -rf /var/lib/apt/lists/*

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
  && rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

ENV ENTRYKIT_VERSION 0.4.0
RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

RUN mkdir -p /src
WORKDIR /src

RUN gem install bundler
RUN bundle config --global build.nokogiri --use-system-libraries

ENTRYPOINT [ \
  "prehook", "ruby -v", "--", \
  "prehook", "bundle install -j3 --quiet", "--", \
  "prehook", "dockerize -timeout 60s -wait tcp://${DATABASE_HOST}:3306", "--", \
  "prehook", "./bin/rails db:create db:migrate db:seed", "--"]
