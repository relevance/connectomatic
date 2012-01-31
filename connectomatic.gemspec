# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "connectomatic/version"

Gem::Specification.new do |s|
  s.name        = "connectomatic"
  s.version     = Connectomatic::VERSION
  s.authors     = ["Relevance Pair"]
  s.email       = ["pair@thinkrelevance.com"]
  s.homepage    = "http://github.com/relevance/connectomatic"
  s.summary     = %q{Manage multiple database connections in your Rails app}
  s.description = %q{Includes extensions to ActiveRecord and rake tasks to make life easy. er.}
  s.extra_rdoc_files = [ "README.md" ]

  s.rubyforge_project = "connectomatic"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"

  s.add_runtime_dependency "rails", "~> 3.0"
end
