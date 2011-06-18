puts "Building on Ruby #{RUBY_VERSION}, #{RUBY_RELEASE_DATE}, #{RUBY_PLATFORM}"

require "rubygems"
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

$:.unshift File.expand_path("../lib", __FILE__)

desc 'Default: run spec tests.'
task :default => 'rspec:unit'

desc 'Cruise task'
task :cruise => 'rspec:unit'

namespace :rspec do
  desc "Run all unit specs"
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.pattern = 'spec/pox_paginate/**/*_spec.rb'
  end
end