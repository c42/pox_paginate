require 'rubygems'
gem 'activeresource', '~> 2.3.5'
gem 'activesupport', '~> 2.3.5'
require 'active_resource'
require 'active_support'
require 'will_paginate'

module PoxPaginate
  Root = File.dirname(__FILE__)
end

require "#{PoxPaginate::Root}/pox_paginate/active_support"
require "#{PoxPaginate::Root}/pox_paginate/remote_collection"
require "#{PoxPaginate::Root}/pox_paginate/active_resource"
require "#{PoxPaginate::Root}/pox_paginate/will_paginate"
require "#{PoxPaginate::Root}/pox_paginate/xml_mini"
