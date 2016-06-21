# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/exception_call/version'

Gem::Specification.new do |spec|
  spec.name          = "rubocop-exception_call"
  spec.version       = Rubocop::ExceptionCall::VERSION
  spec.authors       = ["Masataka Kuwabara"]
  spec.email         = ["p.ck.t22@gmail.com"]

  spec.summary       = %q{例外送出の際のカンマ忘れを指摘するRubocopプラグイン}
  spec.description   = %q{例外送出の際のカンマ忘れを指摘するRubocopプラグイン}
  spec.homepage      = "https://github.com/actcat/rubocop-exception_call"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.licenses = ['MIT']

  spec.add_runtime_dependency "rubocop", "~> 0.40.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec", "~> 3.4.0"
  spec.add_development_dependency 'pry', '~> 0.10.3'
end
