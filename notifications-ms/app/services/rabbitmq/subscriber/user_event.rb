class Rabbitmq::Subscriber::UserEvent
  include Sneakers::Worker

  from_queue "ntms.user.events", exchange: 'users', routing_key: 'user.events.*',
    handler: SneakersHandlers::ExponentialBackoffHandler,
    max_retries: 5,
    arguments: {
      'x-dead-letter-routing-key' => 'ntms.user.events',
      'x-dead-letter-exchange' => 'ntms.dead.monkeys',
      'x-queue-type' => 'quorum'
    },
    exchange_options: {
      type: :topic,
      durable: true
    }

  def work_with_params(serialized_order, delivery_info, metadata)
    message_type = metadata[:type]

    User::SubscriptionInteractor.new(serialized_order).execute(message_type)
    return ack!
  end
end
