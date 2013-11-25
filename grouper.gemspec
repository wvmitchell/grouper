# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grouper/version'

Gem::Specification.new do |spec|
  spec.name          = "grouper"
  spec.version       = Grouper::VERSION
  spec.authors       = ["Will Mitchell"]
  spec.email         = ["wvmitchell@gmail.com"]
  spec.description   = %q{A gem for creating uniq teams from a large group}
  spec.summary       = %q{All classes underneath grouper module}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
