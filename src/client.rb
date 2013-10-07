require 'socket'
class Agent < UDPSocket

end

#hostname = "localhost"
#port = 4913 #server
p ARGV
hostname = ARGV[0]
port = ARGV[1]
client = UDPSocket.new(Socket::AF_INET)
client.bind(hostname, 4910) #if the socket is not binded
                            #the source port will be choose by the OS

# client.send(ARGV[2].nil? ? "Default Message" : ARGV[2],0 , hostname,port) 
# response = client.recvfrom(64)
# puts "#{response[1][2]}:#{response[1][1]} says: #{response[0]}"
client.send(ARGV[2],0,hostname,port) #(Command Row Col)
response = client.recvfrom(64)
puts "#{response[1][2]}:#{response[1][1]} says: #{response[0]}"