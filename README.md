# Sample Rails RabbitMQ

# How to Use?
```sh
docker-compose build
```
```sh
# This script execute the action to populate
# the databases (with db:setup/db:create rake tasks)
# and execute webpacker:install
sudo chmod 777 ./setup.sh
./setup.sh
```
```sh
docker-compose up -d
```

## Consumer
```sh
# In another terminal
#
# ntms: it's a reference of the notification-ms
docker-compose run ntms bundle exec rake sneakers:run
```

## Producer
```sh
# It's execute a rake taks that create
# five Orders. This action will trigger a
# event, that will be listened by notification-ms
#
# There are others rake tasks about Order entity.
# Take a look!
#
# oms: it's a reference of the order-ms
docker-compose run oms bundle exec rake order:create[5]
```
## To see dasboard of RabbitMQ
Access the [http://localhost:15672](http://localhost:15672)

```
user: guest
password: guest
```
