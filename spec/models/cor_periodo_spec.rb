require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CorPeriodo do
  before(:each) do
    @cor = CorPeriodo.new
  end

  it{should belong_to :treinador}
  
  it "should be valid period" do
    @cor.inicio = Date.new
    @cor.fim = @cor.inicio.next()
    @cor.valid?.should be_true
  end

  it "should not be valid period" do
    @cor.fim = Date.new
    @cor.inicio = @cor.fim.next()
    @cor.valid?.should_not be_true
  end
  
  it "should return a corPeriodo by a user" do
    @user = Factory(:user)
    @user.save
    @treinador = Treinador.new
    @treinador.user_id = @user.id
    @treinador.save
    @cor.treinador_id = @treinador.id
    @cor.inicio = Date.new
    @cor.fim = @cor.inicio.next()
    @cor.save    
    @cor.findPeriodoCor(@user).should == [@cor]    
  end

end
