FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY .env /app/.env
RUN bundle install
COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
