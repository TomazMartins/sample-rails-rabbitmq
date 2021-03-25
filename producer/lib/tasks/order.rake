namespace :order do
  desc 'create a new order'
  task :create, [:identifier, :total, :status] => :environment do |task, args|
    begin
      Order::CreateInteractor.new.execute!(
        identifier: args[:identifier],
        status: args[:status],
        total: args[:total]
      )
    rescue ActiveRecord::RecordInvalid => error
      puts "Exception rescue: #{error.message}"
    end
  end
end
