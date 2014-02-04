require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Atleta::TreinosController do
  describe "Atleta" do
    before do
      activate_authlogic
      @treinador = Factory(:treinador)
      @atleta = Factory(:atleta, :treinador_id => @treinador)
      UserSession.create @atleta
    end

    describe "get index" do
      before :each do
        @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
        get :index
      end

      it "should render index" do
        should render_template "index"
      end

      it "should assign treinos" do
        assigns[:treinos].should == [@treino]
      end
    end

    describe "get update" do
      describe "success" do
        def put_it
          put :update, :id => @treino.id, :treino => { :comentario => "Senti a minha coxa" }
        end

        before do
          @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
        end

        it "should change treino.comentario" do
          lambda {
            put_it
            @treino.reload
          }.should change(@treino,:comentario)
        end

        it "should redirect to" do
          put_it
          should redirect_to atleta_treino_path(@treino)
        end
      end

      describe "failure" do
        def put_it
          put :update, :id => @treino.id, :treino => { :date => nil, :comentario => "LALALA" }
        end

        before do
          @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
        end

        it "should not change treino.comentario" do
          lambda {
            put_it
            @treino.reload
          }.should_not change(@treino,:comentario)
        end

        it "should render edit template" do
          put_it
          should render_template 'edit'
        end
      end
    end

    describe "get edit" do
      before(:each) do
        @treino = Factory(:treino, :atleta => Atleta.find(@atleta.atleta_id))
        get :edit, :id => @treino.id
      end
      it "should render edit" do
        should render_template 'edit'
      end

      it "should assign treino" do
        assigns[:treino].should == @treino
      end
    end

    describe "get show" do
      before do
        @treino = Factory(:treino, :atleta_id => @atleta.atleta_id)
        get :show, :id => @treino.id
      end
      it "should render show" do
        should render_template 'show'
      end
      it "should assign a treino" do
        assigns[:treino].should == @treino
      end
    end
  end
end
