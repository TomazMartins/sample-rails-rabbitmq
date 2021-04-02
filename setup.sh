#!/bin/bash

docker-compose run usms bundle exec rake db:create
docker-compose run ntms bundle exec rake db:create
docker-compose run oms bundle exec rake db:create
docker-compose run api bundle exec rake db:create