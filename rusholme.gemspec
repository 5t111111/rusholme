# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rusholme/version'

Gem::Specification.new do |spec|
  spec.name          = "rusholme"
  spec.version       = Rusholme::VERSION
  spec.authors       = ["Hirofumi Wakasugi"]
  spec.email         = ["baenej@gmail.com"]

  spec.summary       = %q{Minimalist's key input to midi note converter (via OSC)}
  spec.description   = %q{Rusholme lets you convert a keyboard input to MIDI note number, and send them to your MIDI player via OSC.}
  spec.homepage      = "https://github.com/5t111111/rusholme"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-termios"
  spec.add_dependency "eventmachine"
  spec.add_dependency "osc-ruby"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "minitest-power_assert"
end
