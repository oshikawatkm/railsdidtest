FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get install -y cron git
RUN mkdir /railsdidtest
WORKDIR /railsdidtest
COPY Gemfile /railsdidtest/Gemfile
COPY Gemfile.lock /railsdidtest/Gemfile.lock
RUN bundle install
COPY . /railsdidtest
RUN bin/rails db:migrate

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]