require 'socket'
hostname = 'localhost'
port = 4913
#hostname = ARGV[0]
#port = ARGV[1]

  server = UDPSocket.new(Socket::AF_INET)
  server.bind(hostname, port)
  loop do
    response = server.recvfrom(64)
    #p response
    puts "#{response[1][2]}:#{response[1][1]} says: #{response[0]}"
    server.send("Roger That", 0, response[1][2],response[1][1]) 

  end
