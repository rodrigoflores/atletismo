require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do
  before do 
    activate_authlogic
  end

  describe "not logged in" do 
    describe "post => create" do
      describe "success" do
        before :each do
          @user = Factory(:user, :email => "a@b.com")
					@user.activated = true
					@user.save
          post :create, :user_session => {:password => "123456", :email => @user.email}
        end

        it "should create a session" do
          UserSession.find.user.should == @user
        end

        it "should redirect to /" do
          should redirect_to "/"
        end

        it "should flash something" do
          flash[:notice].should == "Login efetuado com sucesso."
        end
      end

      describe "failure" do
        before :each do
        end
        def post_it 
          post :create, :user_session => {:password => "1234", :email => ""}
        end
        it "should not create a session" do
          lambda {
            post_it
          }.should_not change(UserSession, :find)
        end
        it "should redirect to /" do
          post_it
          should redirect_to "/"
        end
        it "should flash something" do
          post_it
          flash[:error].should == "Email ou senha inválidos."
        end
      end

    end
  end
  describe "logged in" do
    before :each do
      @user = Factory(:user)
      UserSession.create(@user).should be_true
    end

    describe "delete => destroy" do
      describe "success" do
        it "should destroy a session" do
          delete :destroy
          UserSession.find.should be_nil
        end
        it "should redirect to /" do
          delete :destroy
          should redirect_to "/"
        end
      end
    end
  end
end
