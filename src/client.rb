require 'socket'
hostname = "localhost"
port = 4913 #server
client = UDPSocket.new(Socket::AF_INET)
client.bind(hostname, 4910) #if the socket is not binded
                            #the source port will be choose by the OS

client.send(ARGV.size != 1 ? "Default Message" : ARGV[0],0 , hostname,port) 
response = client.recvfrom(64)
puts "#{response[1][2]}:#{response[1][1]} says: #{response[0]}"