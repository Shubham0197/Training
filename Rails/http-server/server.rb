require "socket"
port = ENV.fetch("PORT", 2002).to_i
server = TCPServer.new port
puts "Listening on port #{port}..."

class Request
  attr_reader :method, :path, :headers, :body

  def initialize(request)
    lines = request.lines
    index = lines.index("\r\n")

    @method, @path, _ = lines.first.split
    @headers = parse_headers(lines[1...index])
    @body = lines[(index+1)..-1].join
  end

  def parse_headers(lines)
    headers = {}

    lines.each do |line|
      name, value = line.split(": ")
      headers[name.downcase] = value.chomp
    end

    headers
  end

  def content_length
    headers["Content-Length"].to_i
  end
end

loop do
  Thread.start(server.accept) do |client|
    request = Request.new client.readpartial(2048)
    p request.content_length

    client.print "HTTP/1.1 200 OK"
    client.print "Content-Type: text/html\r\n"
    client.print "\r\n"
    client.print "Hello World. Time is #{Time.now}.\r\n"
    client.close
  end
end 