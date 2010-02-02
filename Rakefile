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