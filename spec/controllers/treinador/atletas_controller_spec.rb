require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::AtletasController do
  describe "Treinador" do

    before do
      activate_authlogic
      @treinador = Factory(:treinador)
      @atleta = Factory(:atleta, :treinador_id => @treinador.id)
      @treinador_2 = Factory(:treinador, :email => "aaa@bbb.com")
      @atleta_2 = Factory(:atleta, :treinador_id => @treinador_2.id, :email => "ac@ad.com")
        
      UserSession.create @treinador
    end

    describe "get index" do
      it "should render index" do
        get :index
        should render_template "index"
      end

      it "should assign atletas" do
        get :index
        assigns[:atletas].should == [Atleta.find(@atleta.atleta_id)]
      end
    end

    describe "somatorio_de_cargas" do
      
      def get_it
        get :somatorio_de_cargas, :id => @atleta.atleta_id, :somatorio_de_carga => {
              "data_inicial(1i)" => 2010, "data_inicial(2i)" => 1, "data_inicial(3i)" => 1,
              "data_final(1i)" => 2010, "data_final(2i)" => 12, "data_final(3i)" => 12}
      end

      it "should assign atleta" do
        get_it
        assigns[:atleta].should == Atleta.find(@atleta.atleta_id)
      end

      it "should assign atleta" do
        get_it
        assigns[:resultado].should == {"m" => 0.0, "kg" => 0.0, "unidades" => 0.0}
      end
    end

  end
end
