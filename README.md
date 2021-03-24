# Sample Rails RabbitMQ

# How to Use?
```sh
docker-compose build
```
```sh
docker-compose run web bundle exec rake db:setup
```
```sh
docker-compose up -d
```
```sh
dcr web bundle exec rake order:create[O-001-00000001,100.0,paid]
```