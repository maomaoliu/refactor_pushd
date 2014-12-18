require "thread"
require "httpclient"
require 'server'

queue = Queue.new
client = HTTPClient.new
server = Server.new

10.times do
  Thread.new do
    while data = queue.pop
      client.post("https://android.googleapis.com/gcm/send", data, {
                                                             "Authorization" => "key=AIzaSyCABSTd47XeIH",
                                                             "Content-Type" => "application/json"
                                                           })
    end
  end
end

server.start(queue)
