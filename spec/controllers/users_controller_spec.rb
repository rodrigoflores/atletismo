require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
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

end
