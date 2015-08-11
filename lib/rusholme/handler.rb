require "rusholme/osc_client"

module Rusholme
  module Handler
    def convert_note_to_freq(note_number)
      (440 * 2 ** ((note_number - 69)/12.0)).round(1)
    end

    def receive_data(buffer)
      puts ">>> #{convert_note_to_freq(buffer.ord)}"
      osc_client = OSCClient.new
      osc_client.send("/test", convert_note_to_freq(buffer.ord).to_s)
    end
  end
end
