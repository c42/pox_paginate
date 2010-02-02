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
  
  it "should serialize to xml with root node attributes" do
    page = Ooga.paginate :page => 2, :per_page => 2
    xml = page.to_xml
    xml.should match(/<oogas.*type=\"array\".*>\s+<ooga/)
    xml.should match(/<oogas.*current_page=\"2\".*>\s+<ooga/)
    xml.should match(/<oogas.*per_page=\"2\".*>\s+<ooga/)
    xml.should match(/<oogas.*total_entries=\"5\".*>\s+<ooga/)
  end
  
  xit "should foo" do
    page = Ooga.paginate :page => 2, :per_page => 2
    Hash.from_xml(page.to_xml)
  end
end
