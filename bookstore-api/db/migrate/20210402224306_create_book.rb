class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :release_date
      t.string :isbn
      t.string :publisher
      t.string :genre
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
