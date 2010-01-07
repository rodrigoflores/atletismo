class TreinadoresController < ApplicationController
  
  before_filter :login_required
  before_filter :atleta_prohibited

  
  def index
    @user = User.find(current_user)
    @treinador = Treinador.find_by_user_id(@user)
    @atletas = Atleta.find_all_by_treinador_id(@user)
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @user }
    end
  end
  
  def show
    @treinador = Treinador.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @atleta }
    end
  end
  
end