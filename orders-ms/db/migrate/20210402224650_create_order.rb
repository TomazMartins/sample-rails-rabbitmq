class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :identifier
      t.decimal :total
      t.bigint :user_id
      t.string :status

      t.timestamps
    end
  end
end
