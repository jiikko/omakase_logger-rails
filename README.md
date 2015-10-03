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
```ruby
config.log_formatter = ::Logger::Formatter.new
```

## Log
### Before
```
Started GET "/" for ::1 at 2015-10-03 17:21:00 +0900
Processing by TopController#index as HTML
  Rendered top/index.html.slim within layouts/application (6.6ms)
  Rendered shared/_analitics_js.html.erb (0.1ms)
Completed 200 OK in 114ms (Views: 113.8ms | ActiveRecord: 0.0ms)
```
### After
```
Started GET "/" for ::1 at 2015-10-03 17:16:46 +0900 by Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36
Processing by TopController#top as HTML
Completed 200 OK in 132ms (Views: 131.9ms | ActiveRecord: 0.0ms)
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

