require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TreinadoresController do
  before (:each) do 
    activate_authlogic
    UserSession.create(Factory(:treinador))
  end

  describe "get => index" do
    it "should render index" do
      get :index
      should render_template "index"
    end
  end
  
  describe "get => show" do
    it "should render show" do
      get :show
      should render_template "show"
    end
  end
  
end
