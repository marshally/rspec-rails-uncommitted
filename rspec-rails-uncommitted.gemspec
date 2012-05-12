# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rspec-rails-uncommitted/version"

Gem::Specification.new do |s|
  s.name        = "rspec-rails-uncommitted"
  s.version     = Rspec::Rails::Uncommitted::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marshall Yount"]
  s.email       = ["marshall@yountlabs.com"]
  s.homepage    = "https://github.com/marshally/rspec-rails-uncommitted"
  s.summary     = %q{adds rake tasks which selectively run rspec tests based on git status.}
  s.description = %q{adds rake tasks which selectively run rspec tests based on git status.}

  s.rubyforge_project = "rspec-rails-uncommitted"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  
  if Rspec::Rails::Uncommitted::Version::STRING =~ /[a-zA-Z]+/ # prerelease builds
    s.add_runtime_dependency "rspec-rails", "= #{Rspec::Rails::Uncommitted::Version::STRING}"
  else
    s.add_runtime_dependency "rspec-rails", "~> #{Rspec::Rails::Uncommitted::Version::STRING.split('.')[0..1].concat(['0']).join('.')}"
  end
end
