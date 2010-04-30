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

  it "should belong to treinador" do
		should belong_to :treinador
	end
	
  it "should have one user" do
		should have_one :user
	end
	
  it "should  have many provas" do
		should  have_many :provas
	end
	
  it "should have many testes" do
		should have_many :testes
	end

  it "should have many participa_provas" do
		should have_many :participa_provas
	end

  it "should have_many treinos" do
		should have_many :treinos
	end

  it "should create a new instance given valid attributes" do
    Atleta.create!(@valid_attributes)
  end
  
  describe "nome" do
    it "should return the name of the athlete" do
      @user = Factory(:atleta)
      @user.atleta_id = 1
      @atleta = Atleta.find(@user.atleta_id)
      @atleta.nome.should == "omar"
    end
  end
end
