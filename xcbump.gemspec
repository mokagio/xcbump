# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcbump/version'

Gem::Specification.new do |spec|
  spec.name          = "xcbump"
  spec.version       = Xcbump::VERSION
  spec.authors       = ["Giovanni Lodi"]
  spec.email         = ["giovanni.lodi42@gmail.com"]
  spec.summary       = %q{Bump your Xcode project version from the command line.}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  # spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor', '~> 0.17.0'
  spec.add_dependency 'semantic', '~> 1.3.0'
  spec.add_dependency 'xcodeproj', '~> 0.16'
  spec.add_dependency 'plist', '~> 3.1.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
