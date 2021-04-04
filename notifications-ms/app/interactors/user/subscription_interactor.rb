class User::SubscriptionInteractor
  attr_reader :user

  def initialize(hashed_user = {})
    @hashed_user = hashed_user
  end

  def execute(message_type)
    set_strategy(message_type).execute
  end


  private

  def set_strategy(message_type)
    case message_type.to_s
    when 'user.events.created'
      strategy = User::Action::SendCreatedUserEmail.new(@hashed_user)
    when 'user.events.updated'
      strategy = User::Action::SendUpdatedUserEmail.new(@hashed_user)
    end

    return strategy
  end
end
