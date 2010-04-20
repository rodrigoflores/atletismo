require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::AtletasController do
  describe "Treinador" do
    before do
      activate_authlogic
      @treinador = Factory(:treinador)
      UserSession.create @treinador
    end
    describe "get index" do
      it "should render index" do
        get :index
        should render_template "index"
      end
      it "should assign atletas" do
        @atleta = Factory(:atleta, :treinador_id => @treinador.id)
        @treinador_2 = Factory(:treinador, :email => "aaa@bbb.com")
        @atleta_2 = Factory(:atleta, :treinador_id => @treinador_2.id, :email => "ac@ad.com")
        get :index
        assigns[:atletas].should == [Atleta.find(@atleta.atleta_id)]
      end
    end
  end
end
