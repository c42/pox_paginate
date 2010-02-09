module PoxPaginate
  module XmlMini
    module Nokogiri
      def root_node_attributes(xml)
        parser = ::Nokogiri::XML::Reader.from_memory(xml)
        parser.read
        parser.attributes
      end
    end
  end
end
