ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ARG NODE_MAJOR
ARG BUNDLER_VERSION

ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | \
    bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | \
    apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list apt-key add -
RUN apt-get update -qq && \
    apt-get install -y -qq postgresql-client gcc g++ make firefox-esr yarn nodejs

WORKDIR /application

ENV PATH /app/bin:$PATH

ENV BUNDLER_VERSION $BUNDLER_VERSION
RUN gem update --system  && \
    gem install bundler:$BUNDLER_VERSION

COPY ./Gemfile ./Gemfile.lock ./package.json ./yarn.lock ./

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

RUN bundle install
RUN yarn install --check-files

COPY . ./
