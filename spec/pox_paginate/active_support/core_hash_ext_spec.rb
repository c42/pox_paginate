require File.dirname(__FILE__) + '/../../spec_helper'

describe PoxPaginate::ActiveSupport::CoreHashExt do
  
  it 'should from_xml ignores any root attributes other than type' do
    Hash.from_xml(paginated_xml(@date)).should == {"oogas"=>[
              {"name"=>"Foo", "updated_at"=>@date, "id"=>3, "created_at"=>@date}, 
              {"name"=>"Baz", "updated_at"=>@date, "id"=>4, "created_at"=>@date}
                                                            ]}
  end
  
end
