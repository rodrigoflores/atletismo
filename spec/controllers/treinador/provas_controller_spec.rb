require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::ProvasController do
	before do
		activate_authlogic
		@treinador_user = Factory(:treinador)
		@atleta_user = Factory(:atleta, :treinador_id => @treinador_user.id)
		@atleta = Atleta.find(@atleta_user.atleta_id)
		@prova = Factory(:prova, :atleta => @atleta)
		UserSession.create(@treinador_user)
	end

  describe "get => show" do
    it "should assign a test" do
      get :show, :id => @prova.id, :atleta_id => @atleta.id
      assigns[:prova].should == @prova
    end

    it "should assign an athlete" do
      get :show, :id => @prova.id, :atleta_id => @atleta.id
      assigns[:atleta].should == @atleta
    end
  end

  describe "get => index" do
    it "should assign an athlete" do
      get :index, :id => @prova.id, :atleta_id => @atleta.id
      assigns[:atleta].should == @atleta
    end
  end

end
