class Order::CreateInteractor
  include PublisherRabbitMQ


  def initialize
    set_exchange(:orders)
  end

  def execute(identifier:, total:, status:)
    @order = Order.create! do |order|
      order.assign_attributes(
        identifier: identifier,
        status: status,
        total: total
      )
    end

    return @order
  ensure
    publish(Api::V1::OrderSerializer.new(@order).to_json) if @order.present?
  end
end
