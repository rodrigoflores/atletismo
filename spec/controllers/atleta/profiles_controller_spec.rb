require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Atleta::ProfilesController do
	before do
		activate_authlogic
		@treinador_user = Factory(:treinador)
		@atleta_user = Factory(:atleta, :treinador_id => @treinador_user.id)
		@atleta = Atleta.find(@atleta_user.atleta_id)
		UserSession.create(@atleta_user)
	end


	describe "get show" do

		before :each do
			get :show
		end

		it "should assign @atleta" do
			assigns[:atleta].should == @atleta
		end

		it "should render show" do
			should render_template 'show'
		end

	end


	describe "get edit" do
		before :each do
			get :edit
		end

		it "should assign @atleta" do
			assigns[:atleta].should == @atleta
		end

		it "should render edit" do
			should render_template 'edit'
		end
	end

	describe "put update" do

		describe "success" do
			def put_it
				put :update, :atleta => {"nasc(3i)" => "13", "nasc(2i)" => "10", "nasc(1i)" => "2000",
                        :altura => 1.74, :peso => 98, :treinador_id => @atleta.treinador_id,
                        :participa_provas => ["maratona1", "maratona2"]}
			end

			it "should flash something" do
				put_it
				flash[:notice].should_not be_nil
			end

			it "should update atleta" do
				lambda {
					put_it
					@atleta.reload
				}.should change(@atleta, :peso)
			end

			it "should redirect to show" do
				put_it
				should redirect_to atleta_profile_path
			end

		end

		describe "failure" do
			def put_it
				put :update, :atleta => {"nasc(3i)" => "13", "nasc(2i)" => "10", "nasc(1i)" => "2000",
                        :altura => 1.74, :peso => 98, :treinador_id => nil,
                        :participa_provas => ["maratona1", "maratona2"]}
			end

			it "should not flash something" do
				put_it
				flash[:notice].should be_nil
			end

			it "should not update atleta" do
				lambda {
					put_it
					@atleta.reload
				}.should_not change(@atleta, :peso)
			end

			it "should render edit" do
				put_it
				should render_template "edit"
			end

		end
	end
end
