require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Treinador do

  it "should have one user on trainer" do
    should have_one(:user)
  end

  it "should have many cor_treinos" do
    should have_many :cor_treinos
  end
  
  it "should have many cor_periodos" do
    should have_many :cor_periodos
  end

  it "should have many atletas" do
    should have_many :atletas
  end
  
  it "should have many exercicio" do
    should have_many :exercicios
  end
 
  it "should bring back user" do
		activate_authlogic
    @user = Factory(:user)
    @treinador = Treinador.new
    @treinador.user_id = @user.id
    @treinador.save
    @treinador.usuario.should == @user
  end
end
