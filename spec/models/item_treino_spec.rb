require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemTreino do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    ItemTreino.create!(@valid_attributes)
  end
  
  it "should belong to treino" do
    should belong_to :treino
  end
  
  it "should belong to cor_treino" do
    should belong_to :cor_treino
  end

end
