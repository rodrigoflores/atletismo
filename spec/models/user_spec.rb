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
  
end
