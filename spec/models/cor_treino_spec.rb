require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CorTreino do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    CorTreino.create!(@valid_attributes)
  end

  it {should belong_to (:treinador)}

  it "should return a corTreino by a user" do
    @user = Factory(:user)
    @user.save
    @treinador = Treinador.new
    @treinador.user_id = @user.id
    @treinador.save
    @cor = CorTreino.new
    @cor.treinador_id = @treinador.id
    @cor.save
    @cor.findTreinoCor(@user).should == [@cor]
  end
end
