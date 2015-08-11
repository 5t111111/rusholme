require "rusholme/version"
require 'termios'
require 'eventmachine'

module Rusholme

  module KeyboardHandler

    def convert_note_to_freq(note_number)
      (440 * 2 ** ((note_number - 69)/12.0)).round(1)
    end

    def receive_data(buffer)
      puts ">>> #{convert_note_to_freq(buffer.ord)}"
    end
  end

  def self.start
    EM.run do
      attributes = Termios.tcgetattr($stdin).dup
      attributes.lflag &= ~Termios::ECHO
      attributes.lflag &= ~Termios::ICANON
      Termios.tcsetattr($stdin, Termios::TCSANOW, attributes)
      EM.open_keyboard(KeyboardHandler)
    end
  end
end

Rusholme.start
