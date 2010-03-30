require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treinador do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Treinador.create!(@valid_attributes)
  end

  it "should have one user on trainer" do
    pending
    should have_one (:user)
  end

  it "should have many cor_treinos" do
    should have_many :cor_treinos
  end
  
  it "should have many cor_periodos" do
    should have_many :cor_periodos
  end
  
  it "should bring back user" do
    @user = Factory(:user)
    @treinador = Treinador.new
    @treinador.user_id = @user.id
    @treinador.save
    @treinador.usuario.should == @user
  end
end
