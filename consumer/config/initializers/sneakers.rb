require 'sneakers'

Sneakers.configure(connection: Rabbitmq::Subscriber.connection)