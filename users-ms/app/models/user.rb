class User < ApplicationRecord
  with_options presence: true do
    validates :email, uniqueness: true
    validates :cpf, uniqueness: true
    validates :birthdate
    validates :surname
    validates :name
  end
end
