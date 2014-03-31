# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swappy/version'

Gem::Specification.new do |spec|
  spec.name          = "swappy"
  spec.version       = Swappy::VERSION
  spec.authors       = ["Joshua Rieken"]
  spec.email         = ["joshua@joshuarieken.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "trollop", "~> 2"
  spec.add_development_dependency "oj", "~> 2"
  spec.add_development_dependency "yell", "~> 1"
end
