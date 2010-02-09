require File.dirname(__FILE__) + '/../spec_helper'

describe PoxPaginate::XmlMini do
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
        Hash.from_xml(paginated_xml(@date)).should == {"oogas"=>[
              {"name"=>"Foo", "updated_at"=>@date, "id"=>3, "created_at"=>@date}, 
              {"name"=>"Baz", "updated_at"=>@date, "id"=>4, "created_at"=>@date}
            ]}
      end

      it "should know how to extract root node attributes" do
        ActiveSupport::XmlMini.root_node_attributes(paginated_xml(@date)).should == {
          'type' => "array",
          'total_entries' => "10",
          'per_page' => "2",
          'current_page' => "2"
        }
      end
      
      it "should not add root node attributes if there are none" do
        ActiveSupport::XmlMini.root_node_attributes(unpaginated_xml(@date)).should == {
          'type' => "array",
        }
      end
      
    end
  end
end
