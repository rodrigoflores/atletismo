require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CorTreino do
  it {should belong_to(:treinador)}

  it "should find TreinoCor" do
    @user = User.new
    @user.id = 1
    @treinador = Treinador.new
    @treinador.id = 1
    @treinador.user_id = @user
    @treinador.save
    @cor_treino = CorTreino.new
    @cor_treino.treinador = @treinador
    @cor_treino.save
    CorTreino.findTreinoCor(@user).should == [@cor_treino]
  end
end
