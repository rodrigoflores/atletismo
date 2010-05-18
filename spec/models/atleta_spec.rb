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

  describe "put => update_atleta" do
    before do    
      @user = Factory(:atleta)
      @user.atleta_id = 1
      UserSession.create(@user)
      @atleta = Atleta.find(@user.atleta_id)
    end

    describe "participa_provas" do
      before :each do
        @atleta.update_atleta({"nasc(3i)" => "13", "nasc(2i)" => "10", "nasc(1i)" => "2000",
                        :altura => 1.74, :peso => 98, :treinador_id => @atleta.treinador_id,
                        :participa_provas => ["maratona1", "maratona2"]})
        @atleta.reload
      end

      it "should update altura" do
        @atleta.altura.should == 1.74
      end

      it "should update peso" do
        @atleta.peso.should == 98
      end

      it "should update treinador_id" do
        @atleta.treinador_id.should == @atleta.treinador_id
      end

      it "should update participa_provas" do
        @atleta.participa_provas.should be_kind_of [ParticipaProva].class
      end

      it "should find participa_provas" do
        @atleta.update_atleta({"nasc(3i)" => "13", "nasc(2i)" => "10", "nasc(1i)" => "2000",
                        :altura => 1.74, :peso => 98, :treinador_id => @atleta.treinador_id,
                        :participa_provas => [1]})
        @atleta.reload
        @atleta.participa_provas[0].should == ParticipaProva.find(1)
      end

      it "should assign [] if participa_provas is nil" do
        @atleta.update_atleta({"nasc(3i)" => "13", "nasc(2i)" => "10", "nasc(1i)" => "2000",
                        :altura => 1.74, :peso => 98, :treinador_id => @atleta.treinador_id})
        @atleta.reload
        @atleta.participa_provas.should == []
      end
    end
  end
end
