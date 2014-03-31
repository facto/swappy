# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swappy/version'

Gem::Specification.new do |spec|
  spec.name          = 'swappy'
  spec.version       = Swappy::VERSION
  spec.authors       = ['Joshua Rieken']
  spec.email         = ['joshua@joshuarieken.com']
  spec.description   = %q{Swap your config files with ease}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/facto/swappy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'ruby_gntp'

  spec.add_dependency 'oj', '~> 2'
  spec.add_dependency 'trollop', '~> 2'
end
