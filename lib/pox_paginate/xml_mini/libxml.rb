module PoxPaginate
  module XmlMini
    module LibXML
      def root_node_attributes(xml)
        parser = ::LibXML::XML::Reader.string(xml)
        parser.read
        parser.has_attributes? ? parser.node.attributes.to_h : {}
      end
    end
  end
end