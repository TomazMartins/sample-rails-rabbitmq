class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.date :birthdate
      t.string :cpf
      t.string :email

      t.timestamps
    end
  end
end
