# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pimpmychangelog/version"

Gem::Specification.new do |s|
  s.name        = "pimpmychangelog"
  s.version     = PimpMyChangelog::VERSION
  s.authors     = ["Philippe Creux"]
  s.email       = ["pcreux@gmail.com"]
  s.homepage    = "https://github.com/pcreux/pimpmychangelog"
  s.summary     = %q{Pimp your CHANGELOG.md}
  s.description = %q{Linkify issue numbers (#123) and github users (@gregbell) in markdown changelogs.}

  s.default_executable = %q{pimpmychangelog}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rake"
end
