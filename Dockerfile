FROM ruby:2.5.1-alpine

RUN mkdir -p /tools
WORKDIR /tools

RUN apk --update add build-base nodejs sqlite-dev sqlite-libs yarn tzdata git

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

# This is needed for the assets precompile, but its not the one really being used on production
ENV SECRET_KEY_BASE 8b1cb8e13fff204c50433df425a6cb98c6c615ec94e0869a94fce6e8d0e27fe9e3ff1058aed0548f72b07a095a3527b8ac0272b557c51342565fe29b310d7adc

COPY Gemfile /tools
COPY Gemfile.lock /tools
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /tools

RUN bundle exec rails assets:precompile

# No entry point so we can run console, migrate, etc... on the same image.
