require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WelcomeController do
  before do
    activate_authlogic
  end

  describe "get => index" do
    it "should redirect to treinador_path" do
    	pending
      UserSession.create(Factory(:treinador))
      get :index
      should redirect_to treinador_path
    end
    
    it "should redirect to treinador_path" do
    	pending
      UserSession.create(Factory(:user))
      get :index
      should redirect_to :controller => :atletas
    end
  end
  
end
