# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'everyoneapi/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-everyoneapi"
  spec.version       = Everyoneapi::VERSION
  spec.authors       = ["Prabode Weebadde"]
  spec.email         = ["prabode@venturit.com"]
  spec.summary       = %q{Ruby gem for EveryoneAPI}
  spec.description   = %q{Ruby gem for EveryoneAPI, sign up at https://www.everyoneapi.com/}
  spec.homepage      = "https://github.com/venturit/ruby-everyoneapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 0'
end
