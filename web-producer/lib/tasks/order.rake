namespace :order do
  desc 'create a new order'
  task :create, [:identifier, :total, :status] => :environment do |task, args|
    begin
      Order.create! do |order|
        order.assign_attributes(
          identifier:args[:identifier],
          status:args[:status],
          total:args[:total]
        )
      end
    rescue ActiveRecord::RecordInvalid => error
      puts "Exception rescue: #{error.message}"
    end
  end
end
