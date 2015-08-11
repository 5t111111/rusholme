require "rusholme/version"
require 'termios'
require 'eventmachine'

require "rusholme/handler"
require "rusholme/osc_client"

module Rusholme
  def self.start
    EM.run do
      attributes = Termios.tcgetattr($stdin).dup
      attributes.lflag &= ~Termios::ECHO
      attributes.lflag &= ~Termios::ICANON
      Termios.tcsetattr($stdin, Termios::TCSANOW, attributes)
      EM.open_keyboard(Handler)
    end
  end
end
