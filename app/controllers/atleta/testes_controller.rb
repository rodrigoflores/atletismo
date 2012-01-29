class Atleta::TestesController < ApplicationController

	before_filter :require_login
  def index
    @atleta = Atleta.find(current_user.atleta_id)
    @testes = @atleta.testes
  end

  def edit
    @atleta = Atleta.find(current_user.atleta_id)
    @teste = Teste.find(params[:id])
  end

  def show
    @atleta = Atleta.find(current_user.atleta_id)
    @teste = @atleta.testes.find(params[:id])
  end

  def update
    @atleta = Atleta.find(current_user.atleta_id)
    @teste = @atleta.testes.find(params[:id])
    if @teste.update_attributes(params[:teste])
      redirect_to atleta_testes_path
    else
      render "edit"
    end
  end
end
