require "socket"
port = ENV.fetch("PORT", 2002).to_i
server = TCPServer.new port
puts "Listening on port #{port}..."
loop do
  Thread.start(server.accept) do |client|
    request = client.readpartial(2048)
    p request

    client.print "HTTP/1.1 200 OK"
    client.print "Content-Type: text/html\r\n"
    client.print "\r\n"
    client.print "Hello World. Time is #{Time.now}.\r\n"
    client.close
  end
end 