require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treino do
  before(:each) do
    @valid_attributes = {
    }
    @treino = Treino.new 
  end

  describe "Treino" do
    it { should belong_to :atleta }
  end
end
