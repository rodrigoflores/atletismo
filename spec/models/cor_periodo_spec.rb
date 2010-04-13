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
  

end
