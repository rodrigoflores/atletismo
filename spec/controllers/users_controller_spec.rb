require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  before do
    activate_authlogic
  end
  describe "get => new" do
    it "should render signup page" do
      get :new
      should render_template "new"      
    end

    it "should assign user" do
      get :new
      assigns[:user].should be_kind_of User
    end
  end

  describe "post => create" do
    describe "success" do
      def post_it
        post :create, :user => Factory.attributes_for(:user)
      end
      it "should create a new user" do
        lambda {
          post_it
        }.should change(User,:count).by(1)
      end
      it "should redirect to" do
        post_it
        should redirect_to "/"
      end
      it "should flash something" do
        post_it
        flash[:notice].should == "Usuário cadastrado com sucesso! Aguarde um e-mail de ativação contendo link para ativação"
      end
      it "should send an email" do
        lambda {
          post_it
          ActionMailer::Base.deliveries
        }.should change(ActionMailer::Base.deliveries, :size).by(1)
      end
    end
    describe "failure" do
      def post_it
        post :create, :user => Factory.attributes_for(:user, :password_confirmation => "-12334566646")
      end
      it "should not create a new user" do
        lambda {
          post_it
        }.should_not change(User,:count)
      end
      it "should render new" do
        post_it
        should render_template "new"
      end
    end
  end
  
  describe "put => activate" do
    before do
      @user = Factory(:user)
    end
    def put_it
      put :activate, :activation_code => @user.perishable_token
    end
    describe "success" do
      it "should activate the user" do
        lambda {
          put_it
          @user.reload
        }.should change(@user, :perishable_token)
      end
      
      it "should redirect to /" do
        put_it
        should redirect_to "/"
      end
      
      it "should flash something" do 
        put_it
        flash[:notice].should == "Sua confirmação foi realizada com sucesso"
      end
    end
    describe "failure" do 
      def post_it
        put :activate, :activation_code => "123"
      end
      it "should not validate" do
        lambda {
          post_it
          @user.reload
        }.should_not change(@user, :perishable_token)
      end
      it "should redirect to /" do
        post_it
        should redirect_to "/"
      end 
    end
  end
  
  describe "put => forgot_password" do
    describe "success" do
      before do
        @user = Factory(:user)
      end
    
      def put_it
        put :forgot_password, :user => { :email => @user.email }
      end
      it "should send an email containing a new password" do
        lambda{
          put_it
        }.should change(ActionMailer::Base.deliveries, :size).by(1)
      end
      it "should redirect to /" do
        put_it
        should redirect_to "/"
      end
      it "should flash something" do
        put_it
        flash[:notice].should == "Um link de alteração de senha foi enviado para o seu email"
      end
    end
    describe "failure" do 
      def put_it
        put :forgot_password, :user => { :email => "not@an.email.valid" }
      end
      it "should not send an email" do 
        lambda{
          put_it
        }.should_not change(ActionMailer::Base.deliveries, :size)
      end
      it "should flash something" do
        put_it
        flash[:notice].should == "Seu e-mail não foi encontrado em nosso banco de dados"
      end
      it "should render template forgot_password_request" do
        put_it
        should render_template "forgot_password_request"
      end
    end
  end

  describe "get => forgot_password" do
    before :each do
      get :forgot_password_request
    end
    it "should assign user" do 
        assigns[:user].should be_kind_of User
    end
    it "should render forgot_password_request" do
      should render_template "forgot_password_request"
    end
  end
  
  describe "get => reset_password_request" do
    describe "success" do
      before :each do
        @user = Factory(:user)
        get :reset_password_request, :id => @user.perishable_token
      end
      it "should assign user" do 
          assigns[:user].should == @user
      end
      it "should render template" do
        should render_template "reset_password_request"
      end
    end
    describe "failure" do
      before :each do
        get :reset_password_request, :reset_password_token => "aaa"
      end
      it "should redirect to /" do
        should redirect_to "/"
      end
      it "should flash something" do
        flash[:notice].should == "Código de alteração de senha não encontrado."
      end
    end
  end
  
  describe "put => reset_password" do
    describe "success" do
      before :each do
        @user = Factory(:user)
      end
      
      def put_it
        put :reset_password, :user => { :id => @user.id, :password => "abcd", :password_confirmation => "abcd" }
      end
      
      it "should change the password" do 
        lambda { 
          put_it
          @user.reload
        }.should change(@user,:crypted_password)
      end
      
      it "should change the token" do 
        lambda { 
          put_it
          @user.reload
        }.should change(@user,:perishable_token)
      end
      
      it "should redirect to '/'" do
        put_it
        should redirect_to '/'
      end
      
      it "should flash something" do
        put_it
        flash[:notice].should == "Senha alterada com sucesso"
      end
    end
    
    describe "failure" do
      before :each do
        @user = Factory(:user)
      end
      
      def put_it
        put :reset_password, :user => { :id => @user.id, :password => "abcd", :password_confirmation => "abcde" }
      end
      
      it "should not change the password" do 
        lambda { 
          put_it
          @user.reload
        }.should_not change(@user,:crypted_password)
      end
      
      it "should not change the token" do 
        lambda { 
          put_it
          @user.reload
        }.should_not change(@user,:perishable_token)
      end
      
      it "should redirect to '/'" do
        put_it
        should redirect_to :action => 'reset_password_request', :id => @user.perishable_token
      end
      
    end
  end
end
