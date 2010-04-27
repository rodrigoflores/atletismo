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
		
#		describe "get => showProvas" do
#			# Problemas com add provas
#			it "should assign provas" do
#				pending
#				get :showProvas
#				assigns[:provas].should be_kind_of Prova
#			end
#		end
		
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
			describe "success" do
				def put_it
					put :update, :atleta =>  {:altura => "1.80", :peso => "100", :treinador_id => @treinador.id, 
												"nasc(3i)" => "20", "nasc(2i)" => "03", "nasc(1i)" => "2010",
												:participa_provas => ["maratona1", "maratona2"]}
				end
			
				it "should assign atleta" do
					put_it
					assigns[:atleta].should == Atleta.find_by_user_id(@atleta.id)
				end
				it "should flash something" do
					put_it
					flash[:notice].should == 'Atleta foi atualizado com sucesso.'
				end
				
				it "should redirect to atleta" do
					put_it
					should redirect_to atleta_path(@atleta.atleta_id)
				end
			end
			describe "failure" do
				def put_it
					put :update, :atleta =>  {:altura => "1.80", :peso => "100", :treinador_id => "", 
												"nasc(3i)" => "20", "nasc(2i)" => "03", "nasc(1i)" => "2010",
												:participa_provas => ["maratona1", "maratona2"]}
				end
				it "should assign atleta" do
					put_it
					assigns[:atleta].should == Atleta.find_by_user_id(@atleta.id)
				end
				it "should render edit" do
					put_it
					should render_template "edit"
				end
			end
		end
	end
end

