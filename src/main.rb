#!/usr/bin/env ruby
require './server'
require 'pp'
server = Server.new('127.0.0.1',4913)
loop do
  server.board.to_s
  data = server.listen(64)
  puts "#{data[1][2]}:#{data[1][1]} says: #{data[0]}"
  server.process(data[0])
  server.reply(data[1][2],data[1][1])
end

