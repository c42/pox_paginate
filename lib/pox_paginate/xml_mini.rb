module PoxPaginate
  module XmlMini
  end
end


# require "#{PoxPaginate::Root}/pox_paginate/xml_mini/libxml"
# require "#{PoxPaginate::Root}/pox_paginate/xml_mini/nokogiri"
# require "#{PoxPaginate::Root}/pox_paginate/xml_mini/jdom"

ActiveSupport::XmlMini.module_eval do
  delegate :root_node_attributes, :to => :backend
  
  def backend_with_root_node_attributes=(name)
    result = ActiveSupport::XmlMini.backend_without_root_node_attributes=(name)
    deserialiser = @backend.name.demodulize.gsub('XmlMini_', '')
    require "#{PoxPaginate::Root}/pox_paginate/xml_mini/#{deserialiser.downcase}"
    @backend.extend "PoxPaginate::XmlMini::#{deserialiser}".constantize
    result
  end
  alias_method_chain :backend=, :root_node_attributes
end
ActiveSupport::XmlMini.backend=(ActiveSupport::XmlMini.backend)