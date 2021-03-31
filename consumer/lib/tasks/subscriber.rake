namespace :subscriber do
  desc 'Setup queues'
  task :setup, [] => :environment do |task, args|
    Rabbitmq::Subscriber.estabilish_queues
  end
end
