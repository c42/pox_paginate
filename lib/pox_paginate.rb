# Copyright 2009 C42 Engineering

# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
# Unless required by applicable law or agreed to in writing, software distributed under the License 
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
# See the License for the specific language governing permissions and limitations under the License. 

require 'rubygems'
require 'active_resource'
require 'will_paginate'
require 'active_support'

module PoxPaginate
  Root = File.dirname(__FILE__)
end

require "#{PoxPaginate::Root}/pox_paginate/active_support"
require "#{PoxPaginate::Root}/pox_paginate/remote_collection"
require "#{PoxPaginate::Root}/pox_paginate/active_resource"
require "#{PoxPaginate::Root}/pox_paginate/will_paginate"
require "#{PoxPaginate::Root}/pox_paginate/xml_mini"
