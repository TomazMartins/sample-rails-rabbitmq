require 'sneakers'

Sneakers.configure(
  connection: Rabbitmq::Subscriber.instance.connection,
  log: 'sneakers.log',
  workers: 1
)
