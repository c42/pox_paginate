require 'rubygems'
gem 'activesupport', '~> 2.3.5'
gem 'rspec', '~> 1.3.0'

require 'spec'
require 'spec/rake/spectask'

desc 'Default: run spec tests.'
task :default => 'spec:unit'

namespace :spec do
  desc "Run all unit specs"
  Spec::Rake::SpecTask.new(:unit) do |task|
    task.spec_files = FileList['spec/pox_paginate/**/*_spec.rb']
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "pox_paginate"
    gemspec.summary = "Transparent support for pagination using WillPaginate using POX (Plain Old Xml) and ActiveResource"
    gemspec.description = "Transparent support for pagination using WillPaginate using POX (Plain Old Xml) and ActiveResource. This gem is based on our experience building largish distributed systems consisting of multiple Rails apps integrated over POX (Plain Old XML)."
    gemspec.authors = ["Sidu Ponnappa", "Niranjan Paranjape"]
    gemspec.email = "opensource@c42.in"
    gemspec.homepage = "http://c42.in/open_source"
    gemspec.has_rdoc = false
    gemspec.require_path = "lib"
    gemspec.files.exclude *['.gitignore']

    gemspec.test_files.exclude *['.gitignore']
    gemspec.add_dependency('activesupport', '~> 2.3.5')
    gemspec.add_dependency('activeresource', '~> 2.3.5')
    gemspec.add_dependency('will_paginate', '~> 2.3.12')
    gemspec.add_development_dependency('rspc', '~> 1.3.0')
    gemspec.add_development_dependency('activerecord', '~> 2.3.5')
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install technicalpickles-jeweler -s http://gems.github.com"
  puts "If you're using JRuby and are having trouble installing jeweler, try installing the git (gem install git) and rubyforge (gem install rubyforge) gems by hand. Also remember to update gems itself (jruby -S gem update --system)."
end
