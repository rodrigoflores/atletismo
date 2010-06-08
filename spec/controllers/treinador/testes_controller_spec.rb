require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::TestesController do

  describe "logged in" do
    before do
      activate_authlogic
      @treinador_user = Factory(:treinador)
      UserSession.create(@treinador_user)
      @atleta_user = Factory(:atleta, :treinador_id => @treinador_user.id)
      @atleta = Atleta.find(@atleta_user.atleta_id)       
      @teste = Factory(:teste, :atleta => @atleta)
    end
    
    describe "get index" do
      before :each do
        get :index, :atleta_id => @atleta.id
      end
    
      it "should render index" do
        should render_template "index"
      end
      
      it "should assign testes" do
        assigns[:testes].should == [@teste]
      end      
    end
    
    describe "get new" do
      before :each do
        get :new, :atleta_id => @atleta.id
      end
      
      it "should render new" do
        should render_template "new"     
      end
      
      it "should assign teste associated with atleta" do
        assigns[:teste].should be_kind_of Teste
        assigns[:teste].atleta.should == @atleta
      end
    end
    
    describe "get edit" do
      before :each do
        get :edit, :atleta_id => @atleta.id, :id => @teste.id
      end
      
      it "should render edit" do
        should render_template "edit"      
      end
      
      it "should assign teste" do
        assigns[:teste].should == @teste
      end
    end
    
    describe "get show" do
      before :each do
        get :show, :atleta_id => @atleta.id, :id => @teste.id
      end
      
      it "should render show" do
        should render_template "show"
      end
      
      it "should assigns teste" do
        assigns[:teste].should == @teste
        assigns[:teste].atleta.should == @atleta      
      end
    end

    describe "post create" do
      describe "success" do
        def post_it
          post :create, :atleta_id => @atleta.id, :teste => Factory.attributes_for(:teste)
        end
        
        it "should create a new teste" do
          lambda {
            post_it
          }.should change(Teste, :count).by(1)
        end
        
        it "should redirect to index" do
          post_it
          should redirect_to treinador_atleta_testes_path(@atleta)
        end
      end 

      describe "failure" do
        def post_it
          post :create, :atleta_id => @atleta.id, :teste => Factory.attributes_for(:teste, :segundos => 80)
        end
        
        it "should create a new teste" do
          lambda {
            post_it
          }.should_not change(Teste, :count)
        end
        
        it "should redirect to index" do
          post_it
          should render_template "new"
        end
      end       
    end
    
    describe "put update" do
      describe "success" do
        def put_it
          put :update, :atleta_id => @atleta.id, :teste => { :comentarios => "mulher"}, :id => @teste.id
        end

        it "should create a new teste" do
          lambda {
            put_it
            @teste.reload
          }.should change(@teste, :comentarios)
        end

        it "should redirect to index" do
          put_it
          should redirect_to treinador_atleta_testes_path(@atleta)
        end
      
      end
      
      describe "failure" do
        def put_it
          put :update, :atleta_id => @atleta.id, :teste => Factory.attributes_for(:teste, :segundos => 80), :id => @teste.id
        end

        it "should create a new teste" do
          lambda {
            put_it
            @teste.reload
          }.should_not change(@teste, :segundos)
        end

        it "should render to edit" do
          put_it
          should render_template "edit"
        end
      
      end    
    end
    
    describe "delete destroy" do
      def delete_it
        delete :destroy, :atleta_id => @atleta.id, :id => @teste.id
      end
      
      it "should destroy teste" do
        lambda {
          delete_it
        }.should change(Teste, :count).by(-1)
      end
      
      it "should redirect to index" do
        delete_it
        should redirect_to treinador_atleta_testes_path(@atleta)
      end 
    end
  end
end
