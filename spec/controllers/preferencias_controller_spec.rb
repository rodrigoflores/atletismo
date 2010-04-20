require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PreferenciasController do
  before (:each) do
    activate_authlogic
    UserSession.create(Factory(:treinador))
    @periodoCor = Factory(:cor_periodo)
    @treinoCor = Factory(:cor_treino)
  end
  
  describe "get => mostraPeriodoCor" do
    it "should show a PeriodoCor" do
      get :mostraPeriodoCor
      assigns[:corPeriodo][0].should == @periodoCor
    end
  end
  
  describe "get => novoPeriodoCor" do
    it "should assign a PeriodoCor" do
      get :novoPeriodoCor
      assigns[:corPeriodo].should be_kind_of CorPeriodo
    end
  end

  describe "get => mostraTipoTreinoCor" do
    it "should show a CorTreino" do
      get :mostraTipoTreinoCor
      assigns[:corTreino][0].should == @treinoCor
    end
  end
  
  describe "get => novoTipoTreinoCor" do 
    it "should assign a CorTreino" do
      get :novoTipoTreinoCor
      assigns[:corTreino].should be_kind_of CorTreino
    end
  end
  
  describe "post => criaPeriodoCor" do    
    describe "success" do
      def post_it
        post :criaPeriodoCor, :cor_periodo => Factory.attributes_for(:cor_periodo)
      end
    
      it "should create a periodoCor" do
          lambda {
            post_it
          }.should change(CorPeriodo,:count).by(1)
      end
      it "should redirect to mostraPeriodoCor" do
        post_it
        should redirect_to :action => "mostraPeriodoCor"
      end
    end
    
    describe "failure" do
      def post_it
        @date = Date.new
        post :criaPeriodoCor, :cor_periodo => Factory.attributes_for(:cor_periodo, :fim => @date, :inicio => @date.next)
      end

      it "should create a periodoCor" do
          lambda {
            post_it
          }.should_not change(CorPeriodo,:count)
      end
      it "should render mostraPeriodoCor" do
        post_it
        should render_template :action => "novoPeriodoCor"
      end
    end
  end 
  
  describe "post => criaTreinoCor" do    
    def post_it
      post :criaTreinoCor, :cor_treino => Factory.attributes_for(:cor_treino)
    end
  
    it "should create a TreinoCor" do
        lambda {
          post_it
        }.should change(CorTreino,:count).by(1)
    end
    it "should redirect to mostraTipoTreinoCor" do
      post_it
      should redirect_to :action => "mostraTipoTreinoCor"
    end
  end
  
  describe "delete => removePeriodoCor" do    
    def delete_it
      delete :removePeriodoCor, :id => @periodoCor.id
    end
  
    it "should create a PeriodoCor" do
        lambda {
          delete_it
        }.should change(CorPeriodo,:count).by(-1)
    end
    it "should redirect to mostraPeriodoCor" do
      delete_it
      should redirect_to :action => "mostraPeriodoCor"
    end
  end
  
  describe "delete => removeTipoTreinoCor" do    
    def delete_it
      delete :removeTipoTreinoCor, :id => @treinoCor.id
    end
  
    it "should create a TreinoCor" do
        lambda {
          delete_it
        }.should change(CorTreino,:count).by(-1)
    end
    it "should redirect to mostraTipoTreinoCor" do
      delete_it
      should redirect_to :action => "mostraTipoTreinoCor"
    end
  end
  
  describe "put  => atualizaPeriodoCor" do    
    def put_it
      put :atualizaPeriodoCor, :id => @periodoCor.id, :cor_periodo => { :cor => "000000", :periodo => "Maradona" }
    end
  
    it "should create a PeriodoCor" do
        lambda {
          put_it
          @periodoCor.reload
        }.should change(@periodoCor, :cor)
    end
    it "should redirect to mostraPeriodoCor" do
      put_it
      should redirect_to :action => "mostraPeriodoCor"
    end
  end
  
  describe "put  => atualizaTipoTreinoCor" do    
    def put_it
      put :atualizaTipoTreinoCor, :id => @treinoCor.id, :cor_treino => { :cor => "000000", :tipo => "Maradona" }
    end
  
    it "should create a TreinoCor" do
        lambda {
          put_it
          @treinoCor.reload
        }.should change(@treinoCor, :cor)
    end
    it "should redirect to mostraTipoTreinoCor" do
      put_it
      should redirect_to :action => "mostraTipoTreinoCor"
    end
  end
  
end
