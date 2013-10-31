require 'socket'
require './board'
class Server < UDPSocket
  attr_reader :board, :players
  alias_method :listen, :recvfrom
  def initialize(hostname,port,width = 15, height = 15, mines = 1)
    super(Socket::AF_INET)
    @hostname = hostname
    @port = port
    self.bind(@hostname,@port)
    @board = Board.new(width,height,mines)
    @players = []
  end

  def reply(answer,address,port)
    answer ||= "Command executed succesfully"
    send(answer.to_s,0,address,port)
  end

  def process(data)
    command, row, col = data.split(" ")
    case command
      when "1"
        @board.dig_tile!(row.to_i,col.to_i)
      when "2"
        
      end
  end
  def add_player(data)
    @players.push({:ip => data[1][2],:port => data[1][1]})
  end
  def each_player
    @players.each do |player|
      yield player
    end
  end
end

