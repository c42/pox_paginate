require File.dirname(__FILE__) + '/../../spec_helper'

describe 'XmlSerializer Extensions' do
  before :all do
    Ooga.create!(:name => 'Coyote')
    Ooga.create!(:name => 'Meh')
    Ooga.create!(:name => 'Foo')
    Ooga.create!(:name => 'Baz')
    Ooga.create!(:name => 'Woot')
  end
  
  it "should ooga" do
    Ooga.count.should == 5
  end
  
  it "should serialize to xml with root node attributes containing pagination metadata" do
    page = Ooga.paginate :page => 2, :per_page => 2
    xml = page.to_xml
    xml.should match(/<oogas.*type=\"array\".*>\s+<ooga/)
    xml.should match(/<oogas.*current_page=\"2\".*>\s+<ooga/)
    xml.should match(/<oogas.*per_page=\"2\".*>\s+<ooga/)
    xml.should match(/<oogas.*total_entries=\"5\".*>\s+<ooga/)
  end
  
  it "should have rails patched to allow deserialisation of tags with more than one attribute" do
    # Patch at https://rails.lighthouseapp.com/projects/8994-ruby-on-rails/tickets/3217-parsing-an-xml-file-with-multiple-records-and-extra-attributes-besides-type-fails
    page = Ooga.paginate :page => 2, :per_page => 2
    lambda{Hash.from_xml(page.to_xml)}.should_not raise_error
  end
end
