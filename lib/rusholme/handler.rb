require "rusholme/osc_client"

module Rusholme
  module Handler

    KEYBOARD_TABLE = {
                      "a" => "C",
                      "w" => "C#",
                      "s" => "D",
                      "e" => "D#",
                      "d" => "E",
                      "f" => "F",
                      "t" => "F#",
                      "g" => "G",
                      "y" => "G#",
                      "h" => "A",
                      "u" => "A#",
                      "j" => "B"
                     }

    NOTE_TABLE = {
                  "C"  => 36,
                  "C#" => 37,
                  "D"  => 38,
                  "D#" => 39,
                  "E"  => 40,
                  "F"  => 41,
                  "F#" => 42,
                  "G"  => 43,
                  "G#" => 44,
                  "A"  => 45,
                  "A#" => 46,
                  "B"  => 47
                 }

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
      note = KEYBOARD_TABLE.fetch(buffer) { |_k| nil }
      return unless note
      puts "#{note} : #{NOTE_TABLE[note]}"
      osc_client.send("/note", NOTE_TABLE[note])
    end
  end
end
