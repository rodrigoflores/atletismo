require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Atleta::ProvasController do
  before (:each) do
    activate_authlogic
    @atleta = Factory(:atleta)
    @prova = Factory(:prova)  
    UserSession.create(@atleta)
  end
 
  describe "get => new" do
    it "should render provas" do
      get :new
      should render_template :active_scaffold => 'provas'
    end
    
    it "should assign a test" do
      get :new
      assigns[:prova].should be_kind_of Prova
    end
  end
  
  describe "get => index" do
    it "should assign a athlete" do
      get :index
      assigns[:atleta].should be_kind_of Atleta
    end
  end
  
  describe "get => show" do
    it "should render provas" do
      get :show, :id => @prova.id
      should render_template :active_scaffold => 'provas'
    end
    
    it "should assign a test" do
      get :show, :id => @prova.id
      assigns[:prova].should be_kind_of Prova
    end  
  end
  
  describe "get => edit" do
    it "should render provas" do
      get :edit, :id => @prova.id
      should render_template :active_scaffold => 'provas'
    end
    
    it "should assign a test" do
      get :edit, :id => @prova.id
      assigns[:prova].should be_kind_of Prova
    end  
  end
 
   describe "post => create" do
    describe "success" do
      it "should create a prova with an atleta_id" do
        lambda{
          post :create, :prova => Factory.attributes_for(:prova), :atleta_id => @atleta.atleta_id
        }.should change(Prova,:count).by(1)
        flash[:notice].should == 'Prova foi criada com sucesso.'
        should redirect_to atleta_provas_path
      end
      
      it "assigns prova" do
      lambda{
          post :create, :prova => Factory.attributes_for(:prova), :atleta_id => @atleta.atleta_id
        }.should change(Prova,:count).by(1)
        assigns[:prova].should be_kind_of Prova
        assigns[:prova].atleta_id.should == @atleta.atleta_id
        assigns[:provas][0].should be_kind_of Prova
      end
    end  
    
    describe "failure" do
      it "should not create a prova" do
        lambda{
          post :create, :prova => Factory.attributes_for(:prova, :segundos => 569), :atleta_id => @atleta.atleta_id
        }.should_not change(Prova,:count)
        should render_template :action => "new"
      end 
    end
    
  end
 
  describe "put => update" do
    describe "success" do
      it "should update a prova" do
        put :update, :prova => Factory.attributes_for(:prova), :id => @prova.id
        flash[:notice].should == 'Prova foi atualizada com sucesso.'
        should redirect_to atleta_provas_path
      end
    end
    describe "failure" do
      it "should not update a prova" do
        put :update, :prova => Factory.attributes_for(:prova, :segundos => 666), :id => @prova.id
        should render_template :action => "edit"
      end
    end
  end

end
