# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roadrunnr/version'

Gem::Specification.new do |spec|
  spec.name          = "roadrunnr"
  spec.version       = Roadrunnr::VERSION
  spec.authors       = ["kapy2010", "mntdamania"]
  spec.email         = ["kpsingh201091@gmail.com", "mntdamania@gmail.com"]

  spec.summary       = "Wrapper for RoadRunnr API"
  spec.description   = "RoadRunnr API Wrapper"
  spec.homepage      = %q{https://github.com/doormint/roadrunnr}

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency 'httparty', '>= 0.9.0'
  spec.add_dependency 'json'
  spec.add_dependency 'activesupport'
end
