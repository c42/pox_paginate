require 'spec'
require 'spec/rake/spectask'

desc 'Default: run spec tests.'
task :default => 'spec:unit'

namespace :spec do
  desc "Run all unit specs"
  Spec::Rake::SpecTask.new(:unit) do |task|
    task.spec_files = FileList['spec/pox_paginate/**/*_spec.rb']
    # task.spec_opts = ['--options', 'spec/spec.opts']
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "pox_paginate"
    gemspec.summary = "Transparent support for pagination using WillPaginate using POX (Plain Old Xml) and ActiveResource"
    gemspec.description = "Wrest is a HTTP and REST client library which allows you to quickly build well encapsulated, object oriented wrappers around any web service."
    gemspec.authors = ["Sidu Ponnappa", "Niranjan Paranjape"]
    gemspec.email = "opensource@c42.in"
    gemspec.homepage = "http://github.com/kaiwren/wrest"
    gemspec.has_rdoc = false
    gemspec.require_path = "lib"
    gemspec.files.exclude *['.gitignore']
    gemspec.test_files.exclude *['.gitignore']
    gemspec.add_dependency('activesupport', '>= 2.3.5')
    gemspec.add_dependency('activeresource', '>= 2.3.5')
    gemspec.add_dependency('will_paginate', '>= 2.3.12')
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install technicalpickles-jeweler -s http://gems.github.com"
  puts "If you're using JRuby and are having trouble installing jeweler, try installing the git (gem install git) and rubyforge (gem install rubyforge) gems by hand. Also remember to update gems itself (jruby -S gem update --system)."
end
