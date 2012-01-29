require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WelcomeController do
  before do
    activate_authlogic
  end

  describe "get => index" do
    it "should redirect to treinador_path" do
      UserSession.create(Factory(:treinador))
      get :index
      should redirect_to treinador_profile_path
    end

    it "should redirect to treinador_path" do
      UserSession.create(Factory(:atleta))
      get :index
      should redirect_to atleta_profile_path
    end
  end

end
