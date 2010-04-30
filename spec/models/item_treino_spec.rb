require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemTreino do

  it "should belong to treino" do
    should belong_to :treino
  end

  it "should belong to cor_treino" do
    should belong_to :cor_treino
  end

  describe "failure" do
    before do
      activate_authlogic
    end
    it "should validate presence of volume" do
      @item_treino = Factory(:item_treino)
      @item_treino.volume = nil
      @item_treino.valid?.should be_false
    end
    it "should validate presence of grandeza" do
      @item_treino = Factory(:item_treino)
      @item_treino.grandeza = nil
      @item_treino.valid?.should be_false
    end
  end
end
