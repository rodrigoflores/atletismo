require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "authlogic/test_case"

describe AtletasController do
  before do
    activate_authlogic
    @treinador = Factory(:treinador)
    @atleta = Factory(:user,{ :treinador_id => @treinador.id })
		UserSession.create(@atleta)
  end
	describe "user is atleta" do
	
		describe "get => show" do
			it "should assign atleta" do
				get :show
				assigns[:atleta].should == Atleta.find_by_user_id(@atleta.id)
			end
		end
		
		describe "get => showProvas" do
			# Problemas com add provas
			it "should assign provas" do
				pending
				get :show
				get :showProvas
				assigns[:provas].should be_kind_of Prova
			end
		end
		
		describe "get => edit" do
			it "should assign treinadores" do
				get :edit
				assigns[:treinadores].should == [Treinador.find_by_user_id(@treinador.id)]
			end
			it "should assign atleta" do
				get :edit
				assigns[:atleta].should == Atleta.find_by_user_id(@atleta.id)
			end
		end

		describe "put => update"	do
			
			
		end
	end

end

