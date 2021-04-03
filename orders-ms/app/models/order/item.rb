class Order::Item < ApplicationRecord
  self.table_name = :items


  belongs_to :order

  with_options presence: true do
    validates :subtotal
    validates :quantity
    validates :book_id
  end
end
