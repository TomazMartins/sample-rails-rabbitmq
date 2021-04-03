#!/bin/bash

docker-compose run ntms bundle exec rake db:create
docker-compose run usms bundle exec rake db:setup
docker-compose run oms bundle exec rake db:setup
docker-compose run api bundle exec rake db:setup