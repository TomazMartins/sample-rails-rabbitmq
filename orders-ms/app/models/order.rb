class Order < ApplicationRecord
  has_many :items, class_name: 'Order::Item', dependent: :destroy

  after_create :generate_identifier

  validates :identifier, presence: true, on: :update
  validates :identifier, uniqueness: true

  with_options presence: true do
    validates :user_id
    validates :status
    validates :total
  end


  private

  def generate_identifier
    update(identifier: format('O-00001-%08d', id))
  end
end
