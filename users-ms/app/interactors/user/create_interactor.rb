class User::CreateInteractor
  attr_reader :user

  def execute!
    @user = FactoryBot.create(:user)

    return @user
  end
end
