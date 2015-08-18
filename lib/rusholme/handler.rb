require "rusholme/osc_client"
require "noone"

module Rusholme
  module Handler
    def convert_note_to_freq(note_number)
      (440 * 2 ** ((note_number - 69)/12.0)).round(1)
    end

    def receive_data(buffer)
      # puts ">>> #{convert_note_to_freq(buffer.ord)}"
      begin
        osc_client = OSCClient.new
      rescue SocketError => e
        puts e.message
        retry
      end
      # osc_client.send("/message", convert_note_to_freq(buffer.ord).to_s)
      note = Noone::KEYBOARD_TABLE.fetch(buffer) { |_k| nil }
      return unless note
      puts "#{note} : #{Noone::NOTE_TABLE[note]}"
      osc_client.send("/#{note}", Noone::NOTE_TABLE[note])
    end
  end
end
