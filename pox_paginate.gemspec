lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'pox_paginate/version'
Gem::Specification.new do |s|
  s.name        = "pox_paginate"
  s.version     = PoxPaginate::Version::STRING
  s.authors     = ["Sidu Ponnappa", "Niranjan Paranjape"]
  s.email       = ["opensource@c42.in"]
  s.homepage    = "http://c42.in/open_source"
  s.summary     = "Transparent support for pagination using WillPaginate with POX (Plain Old Xml) and ActiveResource"
  s.description = "Transparent support for pagination using WillPaginate with POX (Plain Old Xml) and ActiveResource. This gem is based on C42 Engineering's experience building largish distributed systems consisting of multiple Rails apps integrated over POX (Plain Old XML)."
 
  s.required_rubygems_version = ">= 1.3.0"

  s.files             = Dir.glob("lib/**/*.rb") + %w(README.rdoc CHANGELOG LICENCE)
  s.extra_rdoc_files  = ["README.rdoc"]
  s.rdoc_options      = ["--charset=UTF-8"]
  s.require_path      = 'lib'
  s.test_files        = Dir.glob("spec/**/*.rb")

  # dependencies
  s.add_runtime_dependency "activesupport", ["~> 3.2.0"]
  s.add_runtime_dependency "activeresource", ["~> 3.2.0"]
  s.add_runtime_dependency "will_paginate", ["~> 3.0.0"]
  
  # development dependencies
  s.add_development_dependency "rspec", ["~> 2.7.0"]
  s.add_development_dependency "activerecord", ["~> 3.2.0"]
  s.add_development_dependency "nokogiri", ["~> 1.4.5"]
end

