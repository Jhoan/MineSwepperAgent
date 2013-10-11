#!/usr/bin/env ruby
require './server'
require 'pp'
server = Server.new('127.0.0.1',4913)
data = []
loop do
  server.board.to_s
  data = server.listen(64)
  puts "#{data[1][2]}:#{data[1][1]} says: #{data[0]}"
  answer = server.process(data[0])
  if answer == "*"
  	server.reply("Game Over. You lose",data[1][2],data[1][1])	
  	break
  end
  server.reply(answer,data[1][2],data[1][1])
end
data = server.listen(64)
server.reply("Game over. You win", data[1][2], data[1][1])
