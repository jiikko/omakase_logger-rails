# OmakaseLogger::Rails

OkamaseLogger::Rails to change rails log format.

## Installation

Add this line to your application's Gemfile:

```ruby
group :production do
  gem 'omakase_logger-rails'
end
```

## Features
* Remove `render_template`, `*_fragment` log.
* Write UserAgent and IP log.

## Usage
### config/environments/production.rb
```
config.log_formatter = ::Logger::Formatter.new
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

