require 'server'
require 'worker'

queue = Queue.new
server = Server.new

10.times do
  Worker.new.start(queue)
end

server.start(queue)
