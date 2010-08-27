include Java

import javax.xml.parsers.DocumentBuilder unless defined? DocumentBuilder
import javax.xml.parsers.DocumentBuilderFactory unless defined? DocumentBuilderFactory
import java.io.StringReader unless defined? StringReader
import org.xml.sax.InputSource unless defined? InputSource
import org.xml.sax.Attributes unless defined? Attributes
import org.w3c.dom.Node unless defined? Node

module PoxPaginate
  module XmlMini
    module JDOM
      def root_node_attributes(xml)
        dbf = DocumentBuilderFactory.new_instance
        xml_string_reader = StringReader.new(xml)
        xml_input_source = InputSource.new(xml_string_reader)
        doc = dbf.new_document_builder.parse(xml_input_source)
        attribute_hash = {}
        attributes = doc.document_element.attributes
        for i in 0...attributes.length
           attribute_hash[attributes.item(i).name] =  attributes.item(i).value
         end
        attribute_hash
      end
      
    end
  end
end