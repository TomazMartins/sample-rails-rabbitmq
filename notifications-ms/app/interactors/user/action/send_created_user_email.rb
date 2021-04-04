class User::Action::SendCreatedUserEmail
  include Strategy


  def initialize(hashed_user)
    @hashed_user = hashed_user
  end

  def execute
    puts "Send email about users's creation..."
  end
end
