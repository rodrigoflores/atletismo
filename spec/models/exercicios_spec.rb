require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exercicio do
  before :each do
    activate_authlogic
    @treinador = Factory(:treinador)
    @exercicio = Factory(:exercicio)
    @exercicio.treinador_id = @treinador.treinador_id
  end

  it "should belongs to treinador" do
    should belong_to :treinador
  end

  it "validate presence of exercicio" do
    @exercicio.exercicio = nil
		@exercicio.valid?.should be_false
  end

  it "validate presence of unidade" do
    @exercicio.unidade = nil
		@exercicio.valid?.should be_false
  end

  it "validate presence of treinador_id" do
    @exercicio.treinador_id = nil
		@exercicio.valid?.should be_false
  end

end
