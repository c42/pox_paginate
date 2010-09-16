require 'rubygems'
gem 'rspec', '~> 1.3.0'
gem 'activerecord', '~> 2.3.4'
gem 'activeresource', '~> 2.3.4'

require 'pp'
require 'spec'
require 'active_record'

require File.expand_path(File.dirname(__FILE__) + "/../lib/pox_paginate")

ActiveRecord::Base.establish_connection(YAML::load(File.open(File.dirname(__FILE__) + '/config/database.yml')))
ActiveRecord::Base.logger = Logger.new(File.open(File.dirname(__FILE__) + '/../log/test.log', 'a'))
ActiveRecord::Migrator.up(File.dirname(__FILE__) + '/db/migrate')
WillPaginate.enable_activerecord

class Ooga < ActiveRecord::Base
end

def paginated_xml(date)
<<-EOXML
<?xml version="1.0" encoding="UTF-8"?>
<oogas type="array" total_entries="10" per_page="2" current_page="2">
  <ooga>
    <created-at type="datetime">#{date}</created-at>
    <id type="integer">3</id>
    <name>Foo</name>
    <updated-at type="datetime">#{date}</updated-at>
  </ooga>
  <ooga>
    <created-at type="datetime">#{date}</created-at>
    <id type="integer">4</id>
    <name>Baz</name>
    <updated-at type="datetime">#{date}</updated-at>
  </ooga>
</oogas>
EOXML
end

def unpaginated_xml(date)
<<-EOXML
<?xml version="1.0" encoding="UTF-8"?>
<oogas type="array">
  <ooga>
    <created-at type="datetime">#{date}</created-at>
    <id type="integer">3</id>
    <name>Foo</name>
    <updated-at type="datetime">#{date}</updated-at>
  </ooga>
  <ooga>
    <created-at type="datetime">#{date}</created-at>
    <id type="integer">4</id>
    <name>Baz</name>
    <updated-at type="datetime">#{date}</updated-at>
  </ooga>
</oogas>
EOXML
end
