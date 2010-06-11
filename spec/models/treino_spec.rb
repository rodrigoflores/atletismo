require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treino do
  before(:each) do
    activate_authlogic
    @treinador = Factory(:treinador)
    @atleta = Factory(:atleta, :treinador_id => Treinador.find_by_user_id(@treinador.id))
    @atleta_atleta = Atleta.find(@atleta.atleta_id)
    @date1 = Date.parse("2010-05-05")
    @date2 = Date.parse("2010-05-10")
    UserSession.create(@treinador)
    @exercicio2 = Factory(:exercicio, :unidade => "kg")
    @exercicio4 = Factory(:exercicio, :unidade => "unidades")
    @treino1 = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id), :date => @date1)
    @treino2 = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id), :date => @date2)
    @item1 = Factory(:item_treino, :treino => @treino1)
    @item2 = Factory(:item_treino, :treino => @treino2, :exercicio_id => @exercicio2.id)
    @item3 = Factory(:item_treino, :treino => @treino1)
    @item4 = Factory(:item_treino, :treino => @treino2, :exercicio_id => @exercicio4.id)
  end

  describe "Treino" do
    it { should belong_to :atleta }
  end
  
  describe "Somatório de Cargas" do
    it "should calculate full charge" do
      Treino.somatorio_de_cargas(@atleta_atleta, @date1, @date2).should == {"m" => 1200.0, "kg" => 600.0, "unidades" => 600.0}       
    end
    it "should calculate nothing" do
      Treino.somatorio_de_cargas(@atleta_atleta, @date2.next, @date2.next).should == {"m" => 0.0, "kg" => 0.0, "unidades" => 0.0}       
    end
    it "should calculate only first day" do
      Treino.somatorio_de_cargas(@atleta_atleta, @date1, @date1.next).should == {"m" => 1200.0, "kg" => 0.0, "unidades" => 0.0}       
    end
    it "should calculate only second day" do
      Treino.somatorio_de_cargas(@atleta_atleta, @date1.next, @date2).should == {"m" => 0.0, "kg" => 600.0, "unidades" => 600.0}       
    end
    
  end
  
  describe "validation" do
  	before do
      @treino2 = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id), :date => "2010-05-11")
  	end
		should_validate_uniqueness_of :date, :scope => :atleta_id
	end
  
  
end
