class Publisher
  class << self
    def publish(exchange:, message: {})
      queue = create_exchange(exchange)
      queue.publish(message.to_json)
    end


    private

    def create_exchange(exchange)
      channel = connection.create_channel
      return channel.fanout("app.#{exchange}")
    end

    def connection
      unless @connection.present?
        @connection = Bunny.new(
          host: 'amqp',
          port: 5672,
          ssl: false,
          user: ENV['RABBITMQ_DEFAULT_USER'],
          pass: ENV['RABBITMQ_DEFAULT_PASS']
        ).start
      end

      return @connection
    end
  end
end
