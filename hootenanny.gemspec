# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib",        __FILE__)
$:.push File.expand_path("../app/models", __FILE__)
require 'hootenanny/version'

Gem::Specification.new do |s|
  s.rubygems_version      = '1.3.5'

  s.name                  = 'hootenanny'
  s.rubyforge_project     = 'hootenanny'

  s.version               = Hootenanny::VERSION
  s.platform              = Gem::Platform::RUBY

  s.authors               = %w{jfelchner}
  s.email                 = 'support@thekompanee.com'
  s.date                  = Time.now
  s.homepage              = 'https://github.com/thekompanee/hootenanny'

  s.summary               = "PubSubHubBub Engine for Rails"
  s.description           = %Q{A drop-in PubSubHubBub-compliant Rails Engine for easy hubbubing.}

  s.rdoc_options          = ["--charset = UTF-8"]
  s.extra_rdoc_files      = %w[README.md]

  #= Manifest =#
  s.files                 = `git ls-files`.split($/)
  s.executables           = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files            = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths         = ["lib"]

  s.add_dependency              'rails',                '~> 3.2'

  s.add_development_dependency  'pg'
  s.add_development_dependency  'sqlite3'
  s.add_development_dependency  'rspec-rails',          '~> 2.13'
  s.add_development_dependency  'database_cleaner',     '~> 0.9.1'
  s.add_development_dependency  'rspectacular',         '~> 0.12'
  s.add_development_dependency  'factory_girl_rails',   '~> 4.2'
end
