class User::UpdateInteractor
  attr_reader :user

  def execute!(user_id:, hashed_attributes: {})
    @user = User.find(user_id)

    @user.update(hashed_attributes)
    return @user.reload
  ensure
    serialized_user = Api::V1::UserSerializer.new(@user).as_json
    Rabbitmq::Publisher::UserEvent.new(:updated).publish(serialized_user)
  end
end
