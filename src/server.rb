require 'socket'
require './board'
class Server < UDPSocket
  attr_reader :board
  alias_method :listen, :recvfrom
  def initialize(hostname,port,width = 8, height = 8, mines = 10)
    super(Socket::AF_INET)
    @hostname = hostname
    @port = port
    self.bind(@hostname,@port)
    @board = Board.new(width,height,mines)
  end

  def reply(address,port)
    send("Roger That.",0,address,port)
  end

end

