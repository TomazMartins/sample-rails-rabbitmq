class User::Action::SendUpdatedUserEmail
  include Strategy


  def initialize(hashed_user)
    @hashed_user = hashed_user
  end

  def execute
    puts "Send email about users's update..."
  end
end
