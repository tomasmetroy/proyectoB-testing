FROM ruby:2.7.3
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client
WORKDIR /Rails-Docker
COPY ./Gemfile ./
RUN gem install bundler --version "2.2.27"
RUN bundle install
COPY ./ ./
CMD  bundle exec rails g rspec:install

#EXPOSE 3000
#CMD ["bash"]