class Order::CreateInteractor
  attr_reader :order

  def execute!
    @order = FactoryBot.create(:order)

    return @order
  end
end
