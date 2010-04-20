require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::TreinosController do
  describe "Treinador" do
    before do
      activate_authlogic
      @treinador = Factory(:treinador)
      UserSession.create @treinador
      @atleta = Factory(:atleta, :treinador_id => @treinador)
    end
    
    describe "get new" do
      before :each do
        get :new, :atleta_id => Atleta.find(@atleta.atleta_id).id
      end
      
      it "should render new" do
        should render_template 'new'
      end
      
      it "should assign a treino associated with atleta" do
        assigns[:treino].atleta.should == Atleta.find(@atleta.atleta_id)
      end
      
      it "should assign new" do
        assigns[:treino].should be_kind_of(Treino)
      end
    end
    
    describe "get index" do
      before :each do
        @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
        get :index, :atleta_id => Atleta.find(@atleta.atleta_id).id
      end
      
      it "should render index" do
        should render_template "index"
      end
      
      it "should assign treinos" do
        assigns[:treinos].should == [@treino]
      end
    end
  end
end
