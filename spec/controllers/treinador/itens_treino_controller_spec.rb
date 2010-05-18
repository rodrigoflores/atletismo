require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::ItensTreinoController do
  describe "authenthicated" do 
    before do
      activate_authlogic
      @treinador = Factory(:treinador)
      @atleta_user = Factory(:atleta, :treinador_id => @treinador.id)
      @atleta = Atleta.find(@atleta_user.atleta_id)
      @treino = Factory(:treino, :atleta => @atleta)
      @item_treino = Factory(:item_treino, :treino => @treino)
      UserSession.create(@treinador)
    end
    
    
    describe "delete => :destroy" do
      def delete_it
        delete :destroy, :treino_id => @treino.id, :id => @item_treino.id
      end
      
      it "should delete a item_treino" do 
        lambda{
          delete_it
        }.should change(@treino.itens_treino, :count).by(-1)
      end
      
      it "shoudl redirect to treino" do
        delete_it
        should redirect_to treinador_atleta_treino_path(@atleta, @treino)
      end
    end
    
    
  
    describe "post => create" do
      describe "success" do 
        def post_it 
          post :create, :treino_id => @treino.id, :item_treino => Factory.attributes_for(:item_treino, :treino => @treino)  
        end
        
        it "should add a item treino on @treino" do
          lambda { 
            post_it
           }.should change(@treino.itens_treino, :count).by(1)
        end
        
        it "should redirect to treinos index" do
          post_it
          should redirect_to treinador_atleta_treino_path(@atleta, @treino)
        end
        
      end
      
        describe "failure" do 
        def post_it 
          post :create, :treino_id => @treino.id, :item_treino => Factory.attributes_for(:item_treino, :treino => @treino, :volume => "")  
        end
        
        it "should add a item treino on @treino" do
          lambda { 
            post_it
           }.should_not change(@treino.itens_treino, :count)
        end
        
        it "should render" do
          post_it       
          should render_template 'treinador/treinos/show'
        end
        
      end
    end
    
    
  end
end
