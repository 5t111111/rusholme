require "osc-ruby"

module Rusholme
  class OSCClient
    def initialize(osc_server: "localhost", osc_port: 2345)
      @client = OSC::Client.new(osc_server, osc_port)
    end

    def send(address, data)
      @client.send(OSC::Message.new(address, data))
    end
  end
end
