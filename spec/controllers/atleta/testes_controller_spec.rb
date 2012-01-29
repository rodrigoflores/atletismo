require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Atleta::TestesController do

  describe "logged in" do
    before do
      activate_authlogic
      @treinador = Factory(:treinador)
      @atleta_user = Factory(:atleta, :treinador_id => @treinador.treinador_id)
      UserSession.create(@atleta_user)
      @atleta = Atleta.find(@atleta_user.atleta_id)
      @teste = Factory(:teste, :atleta => @atleta)
    end

    describe "get index" do
      before :each do
        get :index
      end

      it "should render index" do
        should render_template "index"
      end

      it "should assign testes" do
        assigns[:testes].should == [@teste]
      end
    end

    describe "get edit" do
      before :each do
        get :edit, :id => @teste.id
      end

      it "should render edit" do
        should render_template "edit"
      end

      it "should assign teste" do
        assigns[:teste].should == @teste
      end
    end

    describe "get show" do
      before :each do
        get :show, :id => @teste.id
      end

      it "should render show" do
        should render_template "show"
      end

      it "should assigns teste" do
        assigns[:teste].should == @teste
        assigns[:teste].atleta.should == @atleta
      end
    end

    describe "put update" do
      describe "success" do
        def put_it
          put :update, :teste => { :comentarios => "mulher" } , :id => @teste.id
        end

        it "should create a new teste" do
          lambda {
            put_it
            @teste.reload
          }.should change(@teste, :comentarios)
         end

        it "should redirect to index" do
          put_it
          should redirect_to atleta_testes_path
        end

      end

      describe "failure" do
        def put_it
          put :update, :teste => Factory.attributes_for(:teste, :segundos => 80), :id => @teste.id
        end

        it "should create a new teste" do
          lambda {
            put_it
            @teste.reload
          }.should_not change(@teste, :segundos)
        end

        it "should render to edit" do
          put_it
          should render_template "edit"
        end
      end
    end
  end
end
