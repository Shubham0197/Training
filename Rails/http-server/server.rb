require "socket"
require "active_support/all"

port = ENV.fetch("PORT", 2002).to_i
server = TCPServer.new port
puts "Listening on port #{port}..."

class Request
  attr_reader :method, :path, :headers, :body

  def initialize(request)
    lines = request.lines
    index = lines.index("\r\n")

    @method, @path, _ = lines.first.split
    @path, @query = @path.split("?")
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

class Response
  def initialize(code:, body: "")
    @code = code
    @body = body
  end

  def send(client)
    client.print "HTTP/1.1 #{@code}\r\n"
    client.print "Content-Type: text/html\r\n"
    client.print "Content-Length: #{@body.length}\r\n"
    client.print "\r\n"
    client.print "#{@body}.\r\n" if @body.present?

    puts "->#{@code}"
  end
end

def render(path)
  full_path = File.join(__dir__, "views", path)
  if File.exists?(full_path)
    Response.new(code: 200, body: File.binread(full_path))
  else
    Response.new(code: 404)
  end
end

def route(request)
  if request.path == "/"
    render "index.html"
  else
    render request.path
  end
end


loop do
  Thread.start(server.accept) do |client|
    request = Request.new client.readpartial(2048)

    response = route(request)

    response.send(client)

    client.close
  end
end 