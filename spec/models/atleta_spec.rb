require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Atleta do
  before(:each) do
    @valid_attributes = {
    :nasc => "1980-07-10",
    :peso => 80,
    :altura => 180,
    :corre5 => true,
    :corre10 => false,
    :correMeiaMaratona => true,
    :correMaratona => false,
    :user_id => 1,
    :treinador_id => 1 
  }
  end

  it "should create a new instance given valid attributes" do
    Atleta.create!(@valid_attributes)
  end
 
end
