#!/bin/bash

if [ -d tmp ]; then
  sudo rm -rf tmp
  echo "Directory /tmp was deleted"
fi

docker-compose build

# docker-compose run consumer bundle exec rake db:create 
# docker-compose run producer bundle exec rake db:create

docker-compose run usms bundle exec rake db:create