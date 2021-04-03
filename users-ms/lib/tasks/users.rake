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
