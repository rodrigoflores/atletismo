require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treino do
  before(:each) do
    @valid_attributes = {
    }
    @treino = Treino.new
  end

  it "should create a new instance given valid attributes" do
    Treino.create!(@valid_attributes)
  end

  it "should transpose a training matrix" do 
   end

end
