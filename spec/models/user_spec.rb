require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before do
    activate_authlogic
  end

  should_be_authentic
  it "should send a confirmation e-mail on creation"
  it "should send an e-mail containing a new user passowrd request"
  it "should generate an activation code after creation" do
	
    user = Factory(:user)
    user.perishable_token.should_not be_nil
  end
 
 describe "activate" do
   it "Should activate an user" do
      @user = Factory(:user)
      old_perishable_token = @user.perishable_token
      old_activated = @user.activated
      @user.activate
      @user.reload
      @user.perishable_token.should_not == old_perishable_token
      @user.activated.should be_true      
   end
 end
 
 describe "after_create" do
  it "should create an athlete" do
   lambda{
    @user = Factory(:user)   
   }.should change(Atleta,:count).by(1)
   @user.atleta_id.should_not be_nil
   @user.treinador_id.should be_nil
     
  end 
  
  it "should create an coach" do
   lambda{
    @user = Factory(:treinador)   
   }.should change(Treinador,:count).by(1)
   @user.treinador_id.should_not be_nil
   @user.atleta_id.should be_nil
     
  end 
 end   
end
