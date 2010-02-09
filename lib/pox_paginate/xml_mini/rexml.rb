module PoxPaginate
  module XmlMini
    module REXML
      def root_node_attributes(xml)
        require 'rexml/parsers/sax2parser'
        parser = ::REXML::Parsers::SAX2Parser.new(xml)
        root_attributes = nil
        parser.listen(:start_element) do |uri, localname, qname, attributes|
          root_attributes ||= attributes
        end
        parser.parse
        root_attributes
      end
    end
  end
end
