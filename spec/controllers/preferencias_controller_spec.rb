require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PreferenciasController do
  before (:each) do
    @pref = PreferenciasController.new
  end
  
  it "should create a PeriodoCor" do
    @pref.novoPeriodoCor.should be_instance_of(CorPeriodo)
  end
  
  it "should create a CorTreino" do
    @pref.novoTipoTreinoCor.should be_instance_of(CorTreino)
  end
  

end
