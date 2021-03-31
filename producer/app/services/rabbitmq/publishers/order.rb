module Rabbitmq
  class Publishers::Order < Publisher
    EXCHANGE = "producer.orders"


    class << self
      protected

      def create_exchange
        return Publisher.estabilish_channel.fanout(EXCHANGE, durable: true)
      end
    end
  end
end
