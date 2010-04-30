require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestesController do
  before (:each) do
    @teste = Factory(:teste)
    activate_authlogic
    UserSession.create(Factory(:user))
  end

  describe "get => new" do
    it "should render Testes" do
      get :new
      should render_template :active_scaffold => 'Testes'
    end
    
    it "should assign a test" do
      get :new
      assigns[:teste].should be_kind_of Teste
    end
  end
  
  describe "get => show" do
    it "should render Testes" do
      get :show, :id => @teste.id
      should render_template :active_scaffold => 'Testes'
    end
    
    it "should assign a test" do
      get :show, :id => @teste.id
      assigns[:teste].should be_kind_of Teste
    end  
  end
  
  describe "get => edit" do
    it "should render Testes" do
      get :edit, :id => @teste.id
      should render_template :active_scaffold => 'Testes'
    end
    
    it "should assign a test" do
      get :edit, :id => @teste.id
      assigns[:teste].should be_kind_of Teste
    end  
  end
  
  describe "post => create" do
    describe "success" do
      it "should create a test with an atleta_id" do
        lambda{
          post :create, :teste => Factory.attributes_for(:teste, :atleta_id => 1), :atleta_id => 2
        }.should change(Teste,:count).by(1)
        flash[:notice].should == 'Teste foi criado com sucesso.'
        should redirect_to atleta_testes_path(assigns[:testes])
      end
      it "should create a test without an atleta_id" do
        lambda{
          post :create, :teste => Factory.attributes_for(:teste)
        }.should change(Teste,:count).by(1)
        flash[:notice].should == 'Teste foi criado com sucesso.'
        should redirect_to atleta_testes_path(assigns[:testes])
      end
      
      it "assigns teste" do
        lambda{
          post :create, :teste => Factory.attributes_for(:teste, :atleta_id => 1), :atleta_id => 2
        }.should change(Teste,:count).by(1)
        assigns[:teste].should be_kind_of Teste
        assigns[:teste].atleta_id.should == 2
        assigns[:testes][0].should be_kind_of Teste
      end
      
    end  
    
    describe "failure" do
      it "should not create a test" do
        lambda{
          post :create, :teste => Factory.attributes_for(:teste, :atleta_id => 1, :segundos => 569), :atleta_id => 2
        }.should_not change(Teste,:count)
        should render_template :action => "new"
      end 
    end
    
  end

  describe "put => update" do
    describe "success" do
      it "should update a test" do
        put :update, :teste => Factory.attributes_for(:teste), :id => @teste.id
        flash[:notice].should == 'Teste foi atualizado com sucesso.'
        should redirect_to atleta_testes_path(@teste)
      end
    end
    describe "failure" do
      it "should not update a test" do
        put :update, :teste => Factory.attributes_for(:teste, :segundos => 666), :id => @teste.id
        should render_template :action => "edit"
      end
    end
  end
  
end
