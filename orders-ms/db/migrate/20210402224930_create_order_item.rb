class CreateOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.decimal :subtotal
      t.integer :quantity
      t.bigint :book_id
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
