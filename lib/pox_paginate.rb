require 'rubygems'
require 'active_resource'
require 'will_paginate'

module PoxPaginate
  Root = File.dirname(__FILE__)
end

require "#{PoxPaginate::Root}/pox_paginate/remote_collection"
require "#{PoxPaginate::Root}/pox_paginate/active_resource"
require "#{PoxPaginate::Root}/pox_paginate/will_paginate"
require "#{PoxPaginate::Root}/pox_paginate/xml_mini"