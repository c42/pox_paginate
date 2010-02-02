require 'rubygems'
require 'active_record'
require 'active_resource'
require 'will_paginate'

WillPaginate.enable_activerecord

module PoxPaginate
  Root = File.dirname(__FILE__)
end

require "#{PoxPaginate::Root}/pox_paginate/active_record"
require "#{PoxPaginate::Root}/pox_paginate/will_paginate"