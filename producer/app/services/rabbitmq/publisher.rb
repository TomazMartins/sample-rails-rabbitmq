##
# Esta classe é responsável por manter a
# conexão com o RabbitMQ.
#
# Aqui é mantida as configurações necessárias
# para que as operações ocorram
class Rabbitmq::Publisher
  ##
  # Qual o propóstio destas variáveis de classe?
  #
  # É uma boa prática, quando trabalha-se com
  # o RabbitMQ, ter-se apenas ( 1 ) conexão aberta
  # com o broker por processo.
  #
  # É uma boa prática, quando trabalha0se com
  # o RabbitMQ, ter-se apenas ( 1 ) canal aberto
  # na conexão por thread.
  # (os canais não são thread-safe).
  #
  # Colocando-os como variáveis de ambiente aliadas
  # aos métodos "singletons" implementados abaixo,
  # garantimos a unicidade destas entidades.
  @@connection = nil
  @@channel = nil


  class << self
    ##
    # Por intermédio deste método, fazemos publicações
    # no RabbitMQ, a partir de uma chamada à EXCHANGE
    # criada.
    def publish(message)
      create_exchange.publish(message)
    end


    protected

    ##
    # Deve ser implementada pelas classes filhas
    # Esta decisão foi tomada para que as classes
    # filhas tenham a liberdade de criar/acessar
    # a EXCHANGE conforme as suas próprias regras
    def create_exchange
      NotImplementedError.new('Must be implemented by subclasses')
    end

    ##
    # Este método é responsável por criar/acessar
    # o canal com o RabbitMQ.
    #
    # Importante ressaltar que ele tem uma cara
    # de SINGLETON. Isto porque queremos manter
    # apenas ( 1 ) canal o broker. É uma boa prática
    # estabelecer apenas um canal por THREAD.
    #
    # (CHANNELS não são thread-safe)
    def estabilish_channel
      unless @@channel.present?
        @@channel = connection.create_channel
      end

      return @@channel
    end


    private

    ##
    # Este método é responsável por estabelecer
    # a conexão com o RabbitMQ.
    #
    # Para isto, ele isola as configurações para
    # que a conexão seja estabelecida.
    #
    # Importante ressaltar que ele tem uma cara
    # de SINGLETON. Isto porque queremos manter
    # apenas ( 1 ) conexão TCP com o broker. É
    # uma boa prática estabelecer apenas uma
    # conexão por PROCESSO.
    def connection
      unless @@connection.present?
        @@connection = Bunny.new(
          host: 'amqp',
          port: 5672,
          ssl: false,
          user: ENV['RABBITMQ_DEFAULT_USER'],
          pass: ENV['RABBITMQ_DEFAULT_PASS']
        ).start
      end

      return @@connection
    end
  end
end
