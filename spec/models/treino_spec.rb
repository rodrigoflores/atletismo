require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treino do
  before(:each) do
    activate_authlogic
    @treinador = Factory(:treinador)
    @atleta = Factory(:atleta, :treinador_id => Treinador.find_by_user_id(@treinador.id))
    
  end

  describe "Treino" do
    it { should belong_to :atleta }
  end
  
  describe "Somatório de Cargas" do
    it "should calculate sum of charges" do
      @treino1 = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
      #@treino2 = Factory(:treino)
      @item1 = Factory(:item_treino, :treino => @treino1)
      #@item2 = Factory(:item_treino, terino => @treino1)
      #@item3 = Factory(:item_treino, terino => @treino1)
      UserSession.create(@treinador)
      
      @date = Date.new
      Treino.somatorio_de_cargas(Atleta.find(@atleta.atleta_id), @date, @date.next).should == {"m" => 600.0, "kg" => 0.0, "unidade" => 0.0}
    end
  end
  
end
