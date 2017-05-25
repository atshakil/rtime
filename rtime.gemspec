# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rtime/version"

Gem::Specification.new do |spec|
  spec.name          = "rtime"
  spec.version       = RTime::VERSION
  spec.authors       = ["Tahmid Shakil"]
  spec.email         = ["at.shakil.92@gmail.com"]

  spec.summary       = "RTime is a random timestamp generator"
  spec.homepage      = "https://github.com/at-shakil/rtime"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19.4"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "simplecov", "~> 0.13"

  if ENV["TRAVIS"]
    spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0.8"
  end
end
