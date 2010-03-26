require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CorTreino do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    CorTreino.create!(@valid_attributes)
  end

  it {should belong_to (:treinador)}
end
