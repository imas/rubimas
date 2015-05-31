# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubimas/version'

Gem::Specification.new do |spec|
  spec.name          = "rubimas"
  spec.version       = Rubimas::VERSION
  spec.authors       = ["treby"]
  spec.email         = ["treby@atelier-nodoka.net"]
  spec.summary       = %q{All about idolmaster million live!}
  spec.description   = %q{All about idolmaster million live!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0.0"
  spec.add_dependency "hashie", ">= 2.0.5"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "rspec-collection_matchers", "~> 1.0.0"
  spec.add_development_dependency "rspec-its", "~> 1.0.1"
  spec.add_development_dependency "rspec-parameterized", "~> 0.1.2"

  spec.add_development_dependency "parser", "~> 2.2.0.pre4"
end
