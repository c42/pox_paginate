require 'pp'
require 'rubygems'
require 'spec'

require File.expand_path(File.dirname(__FILE__) + "/../lib/pox_paginate")

ActiveRecord::Base.establish_connection(YAML::load(File.open(File.dirname(__FILE__) + '/config/database.yml')))
ActiveRecord::Base.logger = Logger.new(File.open(File.dirname(__FILE__) + '/../log/test.log', 'a'))
ActiveRecord::Migrator.up(File.dirname(__FILE__) + '/db/migrate')

class Ooga < ActiveRecord::Base
end