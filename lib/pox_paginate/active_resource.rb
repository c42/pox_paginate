module PoxPaginate
  module ActiveResource
  end
end

require "#{PoxPaginate::Root}/pox_paginate/active_resource/xml_format"

ActiveResource::Formats::XmlFormat.send :include, PoxPaginate::ActiveResource::XmlFormat