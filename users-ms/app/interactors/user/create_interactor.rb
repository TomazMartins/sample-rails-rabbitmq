class User::CreateInteractor
  attr_reader :user

  def execute!
    @user = FactoryBot.create(:user)

    return @user
  ensure
    serialized_user = Api::V1::UserSerializer.new(@user).as_json
    Rabbitmq::Publisher::UserEvent.new(:created).publish(serialized_user)
  end
end
