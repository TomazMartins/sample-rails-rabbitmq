class Rabbitmq::Subscribers::Order
  include Sneakers::Worker

  from_queue "producer.orders", exchange: 'producer.orders',
    exchange_options: {
      type: :fanout,
      durable: true
    }

  def work(serialized_order)
    puts "============================"
    puts "ORDER: #{serialized_order}"
    puts "============================"

    return ack!
  end
end
