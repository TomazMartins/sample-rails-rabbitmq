##
# Esta classe herda de Rabbitmq::Publisher
#
# A vantagem desta abordagem é que podemos
# manter a conexão - e suas configurações - 
# e o canal isolados e únicos (na classe mãe).
#
# Enquanto isto, podemos nas classes filhas,
# fazer uso das ferramentas já criadas, como
# o método de publicação e os métodoes de conexão
module Rabbitmq
  class Publishers::Order < Publisher
    ##
    # Optei em utilizar de uma CONSTANTE aqui
    # para o nome da exchange por dois pontos:
    #
    # 1. a partir do momento que é declarada,
    #    não poderemos alterar o nome dela,
    #    mantendo a consistência e ordem;
    # 2. deixar explícita a informação.
    EXCHANGE = :orders


    class << self
      ##
      # Este é o único ponto de customização que
      # teremos.
      #
      # Aqui podemos estabelecer:
      # - nome da EXCAHNGE;
      # - as regras da EXCHANGE.
      def create_exchange
        return Publisher.estabilish_channel.fanout("producer.#{EXCHANGE}")
      end
    end
  end
end
