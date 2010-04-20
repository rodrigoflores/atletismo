require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProvasHelper do
  describe "distancia_column" do
    it "should convert a string to integer" do
      @prova = Factory(:prova)
      ProvasHelper::distancia_column(@prova).should == 10
    end
  end
end
