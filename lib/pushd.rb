require 'server'
require 'worker'

class PushDaemon

  def initialize
    @queue = Queue.new
    @server = Server.new
  end

  def start
    start_workers
    start_local_server
  end

  def start_local_server
    @server.start(@queue)
  end

  def start_workers
    10.times { Worker.new.start(@queue) }
  end
end
