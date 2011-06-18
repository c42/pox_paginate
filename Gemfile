source "http://rubygems.org"

gemspec

group :test do
  platforms :jruby do
    gem 'jdbc-sqlite3', '~> 3.6.3.054'
    gem 'activerecord-jdbcsqlite3-adapter', '~> 0.9.7'
  end
  platforms :ruby do
    gem 'sqlite3-ruby', '~> 1.3.1'
    gem 'libxml-ruby', '~> 1.1.4' unless Object.const_defined?('RUBY_ENGINE') && RUBY_ENGINE =~ /rbx/
  end
end