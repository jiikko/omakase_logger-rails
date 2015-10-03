# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omakase_logger/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "omakase_logger-rails"
  spec.version       = OmakaseLogger::Rails::VERSION
  spec.authors       = ["jiikko"]
  spec.email         = ["n905i.1214@gmail.com"]

  spec.summary       = %q{OkamaseLogger::Rails to change rails log format.}
  spec.description   = %q{OkamaseLogger::Rails to change rails log format.}
  spec.homepage      = "https://github.com/jiikko/omakase_logger-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
