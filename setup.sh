#!/bin/bash

docker-compose run ntms bundle exec rake db:create
docker-compose run usms bundle exec rake db:setup
docker-compose run oms bundle exec rake db:setup
docker-compose run api bundle exec rake db:setup


if [ ! -f ./notifications-ms/config/webpacker.yml ]; then
  docker-compose run ntms bundle exec rails webpacker:install
fi
if [ ! -f ./users-ms/config/webpacker.yml ]; then
  docker-compose run usms bundle exec rails webpacker:install
fi
if [ ! -f ./orders-ms/config/webpacker.yml ]; then
  docker-compose run oms bundle exec rails webpacker:install
fi
if [ ! -f ./bookstore-api/config/webpacker.yml ]; then
  docker-compose run api bundle exec rails webpacker:install
fi
