puts "Building on Ruby #{RUBY_VERSION}, #{RUBY_RELEASE_DATE}, #{RUBY_PLATFORM}"

require 'rubygems'
gem 'activesupport', '~> 3.0.0.rc2'
gem 'rspec', '~> 2.0.0.beta.20'

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

$:.unshift File.expand_path("../lib", __FILE__)

desc 'Default: run spec tests.'
task :default => 'rspec:unit'

namespace :rspec do
  desc "Run all unit specs"
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.pattern = 'spec/pox_paginate/**/*_spec.rb'
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "pox_paginate"
    gemspec.summary = "Transparent support for pagination using WillPaginate with POX (Plain Old Xml) and ActiveResource"
    gemspec.description = "Transparent support for pagination using WillPaginate with POX (Plain Old Xml) and ActiveResource. This gem is based on C42 Engineering's experience building largish distributed systems consisting of multiple Rails apps integrated over POX (Plain Old XML)."
    gemspec.authors = ["Sidu Ponnappa", "Niranjan Paranjape"]
    gemspec.email = "opensource@c42.in"
    gemspec.homepage = "http://c42.in/open_source"
    gemspec.has_rdoc = false
    gemspec.require_path = "lib"
    gemspec.files.exclude *['.gitignore']

    gemspec.test_files.exclude *['.gitignore']
    gemspec.add_dependency('activesupport', '~> 3.0.0.rc2')
    gemspec.add_dependency('activeresource', '~> 3.0.0.rc2')
    gemspec.add_dependency('will_paginate', '~> 3.0.pre2')
    gemspec.add_development_dependency('rspec', '~> 2.0.0.beta.20')
    gemspec.add_development_dependency('activerecord', '~> 3.0.0.rc2')
    gemspec.add_development_dependency('sqlite3-ruby', '~> 1.3.1')
    gemspec.add_development_dependency('nokogiri', '~> 1.4.3.1')
    gemspec.add_development_dependency('libxml-ruby', '~> 1.1.4')
    
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
  puts "If you're using JRuby and are having trouble installing jeweler, try installing the git (gem install git) and rubyforge (gem install rubyforge) gems by hand. Also remember to update gems itself (jruby -S gem update --system)."
end
