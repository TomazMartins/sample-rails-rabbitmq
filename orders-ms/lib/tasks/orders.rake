namespace :order do
  desc 'create a new order'
  task :create, [:quantity] => :environment do |task, args|
    begin
      args[:quantity].to_i.times do
        Order::CreateInteractor.new.execute!
      end
    rescue ActiveRecord::RecordInvalid => error
      puts "Exception rescue: #{error.message}"
    end
  end

  desc 'Count orders'
  task :count, [] => :environment do |task, args|
    puts "Quantity of Orders: #{Order.count}"
    puts "Quantity of Items: #{Order::Item.count}"
  end

  desc 'Remove All orders'
  task :clear, [] => :environment do |task, args|
    quantity_orders = Order.count

    Order.destroy_all
    puts "Remove all #{quantity_orders} Orders..."
  end
end
