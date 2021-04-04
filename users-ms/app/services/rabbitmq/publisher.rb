class Rabbitmq::Publisher
  include Singleton

  attr_reader :connection

  def initialize
    @connection = initialize_connection
    @connection.start
  end


  def channel
    @channel ||= ConnectionPool.new do
      @connection.create_channel
    end
  end


  private

  def initialize_connection
    return Bunny.new(
      host: 'amqp',
      port: 5672,
      ssl: false,
      user: ENV['RABBITMQ_DEFAULT_USER'],
      pass: ENV['RABBITMQ_DEFAULT_PASS']
    )
  end
end
