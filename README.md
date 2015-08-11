# Rusholme

Rusholme lets you convert a keyboard input to MIDI note number, and send them to your MIDI player via OSC. It uses `/message` address and 2345 port by default (and you cannnot change them for the moment) .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rusholme'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rusholme

## Usage

```ruby
require "rusholme"

Rusholme.start
```

Rusholme also provides CLI.

```text
$ rusholme
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/5t111111/rusholme.
