require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Atleta do
  before(:each) do
    @valid_attributes = {
    :nasc => "1980-07-10",
    :peso => 80,
    :altura => 180,
    :corre5 => true,
    :corre10 => false,
    :correMeiaMaratona => true,
    :correMaratona => false,
    :user_id => 1,
    :treinador_id => 1 
  }
  
  activate_authlogic
  end

  it { should have_one :user }

  
  it { should have_many :treinos }
  it { should have_many :provas }
  it { should have_many :testes }
  
  it { should belong_to :treinador }

  
  it { should have_many :participa_provas }

  it "should create a new instance given valid attributes" do
    Atleta.create!(@valid_attributes)
  end
  
  describe "nome" do
    it "should return the name of the athlete" do
      @user = Factory(:user)
      @atleta = Atleta.find(@user.atleta_id)
      @atleta.nome.should == "omar"
    end
  
  end
 
end
