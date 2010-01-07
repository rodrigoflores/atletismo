require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItensTreinoController do
  
  before(:each) do 
    @mock_itemTreino = mock_model(ItemTreino,stub={})
  end

  describe "GET index" do
    it "Should list the training items" do
      pending
      @mock_itemTreino.stub!(:tipo => "100m")
      @mock_itemTreino.stub!(:tipo => "400m")
      ItemTreino.should_receive(:find).with(:all).and_return([@mock_itemTreino])
      get :index
      assigns[:itensTreino].should == [@mock_itemTreino]
    end
  end 
  
  describe "GET new" do 
    it "Should show a new training item form" do 
      ItemTreino.should_receive(:new).and_return(@mock_itemTreino)
      get :new
      assigns[:itemTreino].should equal(@mock_itemTreino)    
    end

  end
  
  describe "POST create" do 
    it "should create a new training item if it has a non blank descricao" do
      pending
      @mock_itemTreino.stub!(:tipo => "100m")
      @mock_itemTreinoCreate = mock_model(ItemTreino,:save => true)
      ItemTreino.should_receive(:new).with({"tipo" => "100m"}).and_return(@mock_itemTreinoCreate)

      post :create, :itemTreino => {:tipo => "100m"}
      assigns(:itemTreino).should equal(@mock_itemTreinoCreate)
    end
    
    it "should redirect to the training item index" do 
      pending
      @mock_itemTreino.stub!(:new).and_return(:save => true)
      post :create, :itemTreino => {}
      response.should redirect_to("itens_treino")
    end
  end
  
  describe "DELETE destroy" do
    it "Should remove a training item" do
      pending
      ItemTreino.should_receive(:find).with("1").and_return(@mock_itemTreino)
      @mock_itemTreino.should_receive(:destroy)
      delete :destroy, :id => "1"
    end 
    
    it "Should redirect to the training item index" do
      pending
      ItemTreino.stub!(:find).and_return(mock_model(ItemTreino, :destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to("itens_treino")
    end 
  end

  describe "GET edit" do 
    it "Should show the requested training item" do
      ItemTreino.should_receive(:find).with("12").and_return(@mock_itemTreino)
      get :edit, :id => "12"
      assigns(:itemTreino).should equal(@mock_itemTreino)
    end
  end

  describe "PUT update" do 
    it "should update the training item " do 
      ItemTreino.should_receive(:find).with("12").and_return(@mock_itemTreino)  
      @mock_itemTreino.should_receive(:update_attributes).with({"tipo" => "42m"})
      put :update, :id => "12", :itemTreino => {:tipo => "42m"}
    end
   
    it "should redirect to the training item index" do
      ItemTreino.stub!(:find).and_return(mock_model(ItemTreino,:update_attributes => true))
      put :update, :id => "1"
      response.should redirect_to("itens_treino")
    end

  end

end
