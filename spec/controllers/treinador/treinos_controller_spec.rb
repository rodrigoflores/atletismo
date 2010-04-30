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
    
    describe "get update" do
      describe "success" do
        def put_it
          put :update, :atleta_id => Atleta.find(@atleta.atleta_id).id, :id => @treino.id, :treino => { :comentario => "Ok" }
        end
        
        before do
          @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))  
        end
        
        it "should change treino.comentario" do
          lambda { 
            put_it
            @treino.reload
          }.should change(@treino,:comentario)
        end
        
        it "should redirect to" do
          put_it
          should redirect_to treinador_atleta_treino_path(@atleta.atleta_id, @treino)
        end
      end
      
      describe "failure" do
        def put_it
          put :update, :atleta_id => Atleta.find(@atleta.atleta_id).id, :id => @treino.id, :treino => { :date => nil, :comentario => "AVAC" }
        end
        
        before do
          @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))  
        end
        
        it "should change treino.comentario" do
          lambda { 
            put_it
            @treino.reload
          }.should_not change(@treino,:comentario)
        end
        
        it "should redirect to" do
          put_it
          should render_template 'edit'
        end 
      end
    end
    
    describe "get edit" do
      before(:each) do
        @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
        get :edit, :atleta_id => @atleta.atleta_id, :id => @treino.id
      end
      it "should render edit" do
        should render_template 'edit'
      end
      
      it "should assign treino" do
        assigns[:treino].should == @treino
      end
    end
    
    describe "post create" do
      describe "success" do
        def post_it
          post :create, :treino => Factory.attributes_for(:treino, :atleta_id => @atleta.atleta_id), :atleta_id => @atleta.atleta_id
        end
      
        it "should create a new treino" do
          lambda { 
            post_it
           }.should change(Atleta.find(@atleta.atleta_id).treinos, :count).by(1)
        end

        it "should redirect to show" do
          post_it
          @treino = Treino.last
          should redirect_to treinador_atleta_treino_path(@atleta.atleta_id,@treino)
        end
      end
      
      describe "failure" do
        def post_it
          post :create, :treino => Factory.attributes_for(:treino, :date => nil, :atleta_id => @atleta.atleta_id), :atleta_id => @atleta.atleta_id
        end
        
        it "should not creat a new treino" do
          lambda{
            post_it
          }.should_not change(Atleta.find(@atleta.atleta_id).treinos, :count)        
        end
        
        it "should render new" do
          post_it
          should render_template "new"
        end
      end       
    end 
    
    describe "delete destroy" do
      before do
        @treino = Factory(:treino, :atleta_id => @atleta.atleta_id)
      end
      def delete_it
        delete :destroy, :id => @treino.id, :atleta_id => @atleta.atleta_id
      end
      
      it "should delete a treino" do
        lambda{
          delete_it
        }.should change(Atleta.find(@atleta.atleta_id).treinos, :count).by(-1)
      end
      
      it "redirect to index" do
        delete_it
        should redirect_to treinador_atleta_treinos_path(@atleta.atleta_id)
      end
    end   
   
    describe "get show" do
      before do
        @treino = Factory(:treino, :atleta_id => @atleta.atleta_id)
        get :show, :id => @treino.id, :atleta_id => @atleta.atleta_id
      end
      it "should render show" do
        should render_template "show"
      end
      it "should assign a treino" do
        assigns[:treino].should == @treino
      end
    end
  end
end
