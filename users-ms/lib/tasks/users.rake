namespace :user do
  desc 'create a new user'
  task :create, [:quantity] => :environment do |task, args|
    begin
      args[:quantity].to_i.times do
        User::CreateInteractor.new.execute!
      end
    rescue ActiveRecord::RecordInvalid => error
      puts "Exception rescue: #{error.message}"
    end
  end

  desc 'update an user'
  task :update, [:user_id, :name, :surname] => :environment do |task, args|
    begin
      user_id = args[:user_id].to_i
      hashed_attributes = {
        surname: args[:surname],
        name: args[:name]
      }

      User::UpdateInteractor.new.execute!(
        hashed_attributes: hashed_attributes,
        user_id: user_id
      )
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => error
      puts "Exception rescue: #{error.message}"
    end
  end

  desc 'list all users'
  task :list, [] => :environment do |task, args|
    begin
      users = User.all.map do |user|
        user.attributes
      end

      puts "USERS: #{users}"
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => error
      puts "Exception rescue: #{error.message}"
    end
  end

  desc 'Count users'
  task :count, [] => :environment do |task, args|
    puts "Quantity of Users: #{User.count}"
  end

  desc 'Remove All users'
  task :clear, [] => :environment do |task, args|
    quantity_users = User.count

    User.destroy_all
    puts "Remove all #{quantity_users} users..."
  end
end
