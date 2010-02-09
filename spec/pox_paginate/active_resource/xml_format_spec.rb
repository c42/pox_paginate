require File.dirname(__FILE__) + '/../../spec_helper'

describe PoxPaginate::ActiveResource::XmlFormat do
  it "should foo" do
    ::ActiveSupport::XmlMini.backend = 'LibXML'
    collection = ActiveResource::Formats::XmlFormat.decode(paginated_xml(DateTime.parse('2010-02-06T21:09:48+05:30')))
    collection.should be_a(PoxPaginate::RemoteCollection)
  end
end
