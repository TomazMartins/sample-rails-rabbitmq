class CreateAuthor < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :surname
      t.date :birthdate
      t.string :cpf
      t.string :email
      t.string :publisher

      t.timestamps
    end
  end
end
