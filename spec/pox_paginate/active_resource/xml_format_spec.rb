require File.dirname(__FILE__) + '/../../spec_helper'

describe PoxPaginate::ActiveResource::XmlFormat do
  xml_backends.each do |deserialiser|
    context "using #{deserialiser}" do
      it "should create a RemoteCollection after parsing paginated array" do
        ::ActiveSupport::XmlMini.backend = deserialiser
        collection = ActiveResource::Formats::XmlFormat.decode(paginated_xml(DateTime.parse('2010-02-06T21:09:48+05:30')))
        collection.should be_a(PoxPaginate::RemoteCollection)
      end
    end
  end
end
