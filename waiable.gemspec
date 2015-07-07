# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waiable/version'

Gem::Specification.new do |spec|
  spec.name          = "waiable"
  spec.version       = Waiable::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Sanghapal Bhowate", "Shantanu Choudhury"]
  spec.email         = ["sangha@techvision.net.in", "shantanu@techvision.net.in", "developer@techvision.net.in"]
  spec.summary       = %q{Making rails accessible !}
  spec.description   = %q{Accessible rails form by including aria properties in rails form helper classes.}
  spec.homepage      = "https://github.com/techvision/waiable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~>0"
  spec.add_development_dependency "rake", "~>0"
  spec.add_development_dependency "minitest", "~>0"
  spec.add_dependency "rails", "~>0"
end
