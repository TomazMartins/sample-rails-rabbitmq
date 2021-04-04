class Rabbitmq::Publisher::UserEvent
  EXCHANGE = :users


  def initialize(message_type)
    @message_type = message_type.to_s
  end

  def publish(hashed_message)
    Rabbitmq::Publisher.instance.channel.with do |channel|
      channel.
        topic(EXCHANGE, no_declare: true).
        publish(hashed_message.to_json, options)
    end
  end


  private

  def options
    return {
      routing_key: "user.events.#{@message_type}",
      type: "user.events.#{@message_type}"
    }
  end
end
