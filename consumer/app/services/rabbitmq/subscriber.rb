class Rabbitmq::Subscriber
  EXCHANGE = "producer.orders"


  @@connection = nil
  @@channel = nil
  @@queues = [
    'producer.orders.created',
    'producer.orders.updated'
  ]


  class << self
    def connection
      return estabilish_connection
    end

    def queues
      return @@queues
    end

    def estabilish_queues
      queues.each do |queue_name|
        estabilish_channel.queue(queue_name, durable: true).bind(EXCHANGE)
      end
    end


    private

    def estabilish_channel
      unless @@channel.present?
        @@channel = instantiate_connection.create_channel
      end

      return @@channel
    end

    def instantiate_connection
      return estabilish_connection.start
    end

    def estabilish_connection
      unless @@connection.present?
        @@connection = Bunny.new(
          host: 'amqp',
          port: 5672,
          ssl: false,
          user: ENV['RABBITMQ_DEFAULT_USER'],
          pass: ENV['RABBITMQ_DEFAULT_PASS']
        )
      end

      return @@connection
    end
  end
end
