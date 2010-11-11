require 'rubygems'
require "pox_paginate"

require 'rspec'


require 'active_record'
require 'will_paginate/finders/active_record'

ActiveRecord::Base.establish_connection(YAML::load(File.open(File.dirname(__FILE__) + '/config/database.yml')))
ActiveRecord::Base.logger = Logger.new(File.open(File.dirname(__FILE__) + '/../log/test.log', 'a'))
ActiveRecord::Migrator.up(File.dirname(__FILE__) + '/db/migrate')

WillPaginate::Finders::ActiveRecord.enable!

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

def xml_backends
  RUBY_PLATFORM =~ /java/ ? %w(REXML JDOM) : %w(REXML LibXML Nokogiri)
end