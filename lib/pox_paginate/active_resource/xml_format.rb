module PoxPaginate
  module ActiveResource
    module XmlFormat
      def self.included(mod)
        mod.module_eval do
          def decode_with_pagination_support(xml)
            deserialised_xml = decode_without_pagination_support(xml)
            root_attributes = ::ActiveSupport::XmlMini.root_node_attributes(xml)
            if root_attributes['type'] == "array" && root_attributes['current_page']
              RemoteCollection.create(root_attributes['current_page'], root_attributes['per_page'], root_attributes['total_entries']) do |pager|
                pager.replace deserialised_xml
              end
            else
              deserialised_xml
            end
          end
          alias_method_chain :decode, :pagination_support
        end
      end
    end
  end
end
