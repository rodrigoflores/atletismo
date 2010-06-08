require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::ProfilesController do

	describe "logged in" do
	  before do
      activate_authlogic
      @treinador_user = Factory(:treinador)
      @treinador = Treinador.find(@treinador_user.id)
      UserSession.create(@treinador_user)
    end
    
		describe "get show" do
			before :each do 
				get :show
			end
		
			it "should assign treinador" do
				assigns[:treinador].should == @treinador
			end
			
			it "should render show" do
				render_template "show"
			end
		end
	end
end
