require "thread"
require "httpclient"

class Worker
  def initialize
    @client = HTTPClient.new
  end

  def start(queue)
    Thread.new do
      while data = queue.pop
        @client.post("https://android.googleapis.com/gcm/send", data, {
                                                               "Authorization" => "key=AIzaSyCABSTd47XeIH",
                                                               "Content-Type" => "application/json"
                                                             })
      end
    end
  end
end