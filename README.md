# OmakaseLogger::Rails

OkamaseLogger::Rails to change rails log format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omakase_logger-rails'
```

## Features
* Remove `render_template`, `*_fragment`.
* Write UserAgent.

## Usage
### config/environments/production.rb
```ruby
config.log_formatter = ::OmakaseLogger::Rails::Formatter.new
config.log_tags = [ :uuid, :remote_ip ]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

