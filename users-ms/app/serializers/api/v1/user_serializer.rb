class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user

  attributes :name, :surname, :birthdate, :cpf, :email
end
