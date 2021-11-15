FROM ruby:2.7.3
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client
WORKDIR /Rails-Docker
COPY ./Gemfile ./
RUN gem install bundler --version "2.2.27"
RUN bundle install
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn
COPY ./ ./
