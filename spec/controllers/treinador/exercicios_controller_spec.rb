require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::ExerciciosController do
  before :each do
    activate_authlogic
    @treinador = Factory(:treinador)
    UserSession.create(@treinador)
    @exercicio = Factory(:exercicio)
    @exercicio.treinador_id = @treinador.treinador_id
  end

  describe "get => index" do
    it "should assign exercicios" do
      get :index
      assigns[:exercicios].should == [@exercicio]
    end

    it "should render index" do
      get :index
      should render_template "index"
    end
  end

  describe "get => new" do
    it "should render new" do
      get :new
      should render_template "new"
    end

    it "should assign new exercicio" do
      get :new
      assigns[:exercicio].should be_kind_of Exercicio
    end
  end

  describe "get => edit" do
    it "should render edit" do
      get :edit, :id => @exercicio.id
      should render_template "edit"
    end

    it "should assign an exercicio" do
      get :edit, :id => @exercicio.id
      assigns[:exercicio].should == @exercicio
    end
  end

  describe "post => create" do
    describe "success" do
      def post_it
        post :create, :exercicio => Factory.attributes_for(:exercicio)
      end

      it "should redirect to index" do
        post_it
        should redirect_to treinador_exercicios_path
      end

      it "should create a new exercicio" do
        lambda {
          post_it
        }.should change(Exercicio, :count).by(1)
      end
    end

   describe "failure" do
      def post_it
        post :create, :exercicio => Factory.attributes_for(:exercicio, :unidade => "")
      end

      it "should not create a new exercicio" do
        lambda {
          post_it
        }.should_not change(Exercicio, :count)
      end

      it "should render new" do
        post_it
        should render_template "new"
      end
    end
  end

  describe "put => update" do
    describe "success" do
      def put_it
        put :update, :exercicio => Factory.attributes_for(:exercicio, :exercicio => "Andar"), :id => @exercicio.id
      end

      it "should redirect to index" do
        put_it
        should redirect_to treinador_exercicios_path
      end

      it "should update a new exercicio" do
        lambda {
          put_it
          @exercicio.reload
        }.should change(@exercicio, :exercicio)
      end
    end

   describe "failure" do
      def put_it
        put :update, :exercicio => Factory.attributes_for(:exercicio, :exercicio => ""), :id => @exercicio.id
      end

      it "should redirect to index" do
        put_it
        should render_template "edit"
      end

      it "should update a new exercicio" do
        lambda {
          put_it
          @exercicio.reload
        }.should_not change(@exercicio, :exercicio)
      end
    end
  end
end
