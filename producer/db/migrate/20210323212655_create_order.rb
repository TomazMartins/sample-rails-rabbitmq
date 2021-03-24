class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :identifier
      t.decimal :total
      t.string :status
    end
  end
end
