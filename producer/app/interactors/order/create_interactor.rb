class Order::CreateInteractor
  def execute!(identifier:, total:, status:)
    @order = Order.create! do |order|
      order.assign_attributes(
        identifier: identifier,
        status: status,
        total: total
      )
    end

    return @order
  ensure
    if @order.present?
      serialized_order = Api::V1::OrderSerializer.new(@order).to_json
      Rabbitmq::Publishers::Order.publish(serialized_order)
    end
  end
end
