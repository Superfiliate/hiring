# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* In order to run the application
  - docker compose build --no-cache; docker compose up
  - docker-compose run app bundle exec rake db:create
  - docker-compose run app bundle exec rake db:migrate

* Run tests
  - docker-compose run test bundle exec rake db:create RAILS_ENV=test
  - docker-compose run test bundle exec rake db:migrate RAILS_ENV=test
  - docker-compose run test bundle exec rspec