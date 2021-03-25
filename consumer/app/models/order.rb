class Order < ApplicationRecord
  after_create :publish_to_dashboard


  private

  def publish_to_dashboard
    Publisher.publish(exchange: :orders, message: attributes)
  end
end
