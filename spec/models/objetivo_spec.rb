require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Objetivo do
  should_validate_presence_of :nome

  before(:each) do
    activate_authlogic
    @treinador = Factory(:treinador)
    UserSession.create(@treinador)
    
  end
  
  describe "Objetivo" do
    it { should belong_to :treinador }
  end


end
