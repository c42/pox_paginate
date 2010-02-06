require File.dirname(__FILE__) + '/../spec_helper'

describe PoxPaginate::XmlMini do
  def xml(date)
    <<-EOXML
<?xml version="1.0" encoding="UTF-8"?>
<oogas type="array" total_entries="10" per_page="2" current_page="2">
  <ooga>
    <created-at type="datetime">#{date}</created-at>
    <id type="integer">3</id>
    <name>Foo</name>
    <updated-at type="datetime">#{date}</updated-at>
  </ooga>
  <ooga>
    <created-at type="datetime">#{date}</created-at>
    <id type="integer">4</id>
    <name>Baz</name>
    <updated-at type="datetime">#{date}</updated-at>
  </ooga>
</oogas>
EOXML
  end
  
  before :all do
    @date = DateTime.parse('2010-02-06T21:09:48+05:30')
  end
  
  %w(REXML LibXML Nokogiri).each do |deserialiser|
    describe "using #{deserialiser}" do
      before :all do
        ActiveSupport::XmlMini.backend = deserialiser
      end

      it "should be using the #{deserialiser} backend" do
        ActiveSupport::XmlMini.backend.name.should == "ActiveSupport::XmlMini_#{deserialiser}"
      end
      
      it "should decorate backend= to extend the XmlMini_#{deserialiser} module" do
        "ActiveSupport::XmlMini_#{deserialiser}".constantize.should respond_to(:root_node_attributes)
        ActiveSupport::XmlMini.backend.name.should == "ActiveSupport::XmlMini_#{deserialiser}"
      end
    
      it "should parse xml with header attributes into a hash" do
        Hash.from_xml(xml(@date)).should == {"oogas"=>[
              {"name"=>"Foo", "updated_at"=>@date, "id"=>3, "created_at"=>@date}, 
              {"name"=>"Baz", "updated_at"=>@date, "id"=>4, "created_at"=>@date}
            ]}
      end
    end
  end

  describe "LibXML" do
    before :all do
      ActiveSupport::XmlMini.backend = 'LibXML'
    end
    
    it "should be using the LibXML backend" do
      ActiveSupport::XmlMini.backend.name.should == 'ActiveSupport::XmlMini_LibXML'
    end
    
    it "should know how to extract root node attributes" do
      ActiveSupport::XmlMini.root_node_attributes(xml(@date)).should == {
        'type' => "array",
        'total_entries' => "10",
        'per_page' => "2",
        'current_page' => "2"
      }
    end
  end
end
