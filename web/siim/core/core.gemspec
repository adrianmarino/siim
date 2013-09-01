$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "core"
  s.version     = Core::VERSION
  s.authors     = ["Adrian Norberto Marino"]
  s.email       = ["adrianmarino@gmail.com"]
  s.homepage    = "http://nonosoft.com.ar"
  s.summary     = "Reusable components."
  s.description = "Reusable components."

  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
end
