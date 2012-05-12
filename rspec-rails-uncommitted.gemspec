# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rspec-rails-uncommitted/version"

Gem::Specification.new do |s|
  s.name        = "rspec-rails-uncommitted"
  s.version     = Rspec::Rails::Uncommitted::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marshall Yount"]
  s.email       = ["marshall@yountlabs.com"]
  s.homepage    = "https://github.com/marshally/rspec-rails-uncommitted"
  s.summary     = %q{adds rake tasks which selectively run rspec tests based on git status.}
  s.description = %q{adds rake tasks which selectively run rspec tests based on git status.}

  s.rubyforge_project = "rspec-rails-uncommitted"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
