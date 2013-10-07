require 'socket'
require './board'
class Server < UDPSocket
  attr_reader :board
  alias_method :listen, :recvfrom
  def initialize(hostname,port,width = 15, height = 15, mines = 1)
    super(Socket::AF_INET)
    @hostname = hostname
    @port = port
    self.bind(@hostname,@port)
    @board = Board.new(width,height,mines)
  end

  def reply(address,port)
    send("Roger That.",0,address,port)
  end

  def process(data)
    command, row, col = data.split(" ")
    case command
      when "1"
        @board.dig_tile!(row.to_i,col.to_i)
      end
    end

end

