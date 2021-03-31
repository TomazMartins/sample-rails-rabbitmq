class Rabbitmq::Publisher
  @@connection = nil
  @@channel = nil


  class << self
    def publish(message)
      create_exchange.publish(message)
    end


    protected

    def create_exchange
      NotImplementedError.new('Must be implemented by subclasses')
    end

    def estabilish_channel
      unless @@channel.present?
        @@channel = connection.create_channel
      end

      return @@channel
    end


    private

    def connection
      unless @@connection.present?
        @@connection = Bunny.new(
          host: 'amqp',
          port: 5672,
          ssl: false,
          user: ENV['RABBITMQ_DEFAULT_USER'],
          pass: ENV['RABBITMQ_DEFAULT_PASS']
        ).start
      end

      return @@connection
    end
  end
end
