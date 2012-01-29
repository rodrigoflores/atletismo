require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Treinador::ObjetivosController do



  before do
    activate_authlogic
    @treinador_user = Factory(:treinador)
    @objetivo = Factory(:objetivo, :treinador_id => @treinador_user.treinador_id)
    UserSession.create(@treinador_user)
    @treinador = Treinador.find(@treinador_user.treinador_id)

  end


  describe "get => index" do
    it "should render template index" do
      get :index
      should render_template "index"
    end

    it "should assign objetivos" do
      get :index
      assigns[:objetivos].should == [@objetivo]
    end
  end

  describe "get => update" do
    it "should render template edit" do
      get :edit, :id => @objetivo.id
      should render_template "edit"
    end

    it "should assign objetivo" do
      get :edit, :id=>@objetivo.id
      assigns[:objetivo].should == @objetivo
    end
  end

  describe "put => update" do

    describe "success" do
      def put_it
        put :update, :id => @objetivo.id, :objetivo => Factory.attributes_for(:objetivo, :nome => "Velocidade", :treinador_id => @treinador.id)
      end
      it "should change objetivo nome" do
        lambda {
          put_it
          @objetivo.reload
        }.should change(@objetivo,:nome)
      end

      it "should redirect to index" do
        put_it
        should redirect_to treinador_objetivos_path
      end
    end

    describe "failure" do
      def put_it
        put :update, :id => @objetivo.id, :objetivo => Factory.attributes_for(:objetivo, :nome => "", :treinador_id => @treinador.id)
      end
      it "should not change objetivo nome" do
        lambda {
          put_it
          @objetivo.reload
        }.should_not change(@objetivo,:nome)
      end

      it "should redirect to index" do
        put_it
        should render_template "edit"
      end
    end
  end

  describe "get => new" do
    it "should render template new" do
      get :new
      should render_template "new"
    end
  end

  describe "post => create" do

    describe "sucess" do
      def post_it
        post :create, :objetivo => Factory.attributes_for(:objetivo, :nome => "novo", :treinador_id => @treinador.id)
      end

      it "should increase the size of objetivos" do
        lambda {
          post_it
        }.should change(@treinador.objetivos, :count).by(1)
      end

      it "should redirect to index" do
        post_it
        should redirect_to treinador_objetivos_path
      end
    end

    describe "failure" do
      def post_it
        post :create, :objetivo => Factory.attributes_for(:objetivo, :nome => "", :treinador_id => @treinador.id)
      end
      it "should not change the size of objetivos" do
        lambda{
          post_it
        }.should_not change(@treinador.objetivos, :count)
      end

      it "should render new" do
        post_it
        should render_template "new"
      end
    end
  end
end
