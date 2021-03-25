class Api::V1::OrderSerializer
  include FastJsonapi::ObjectSerializer
  set_type :order

  attributes :identifier, :total, :created_at, :updated_at, :status
end
