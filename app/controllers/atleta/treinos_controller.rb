class Atleta::TreinosController < ApplicationController

	before_filter :require_login

  def index
    @atleta = Atleta.find(current_atleta)
    @treinos = @atleta.treinos
  end

  def update
    @atleta = Atleta.find(current_user.atleta_id)
    @treino = @atleta.treinos.find(params[:id])
    @comentario = @treino.comentario
    if @comentario != params[:treino][:comentario]
      @treino.visualizado = false
    end
    if @treino.update_attributes(params[:treino])
      redirect_to atleta_treino_path(@treino)
    else
      render 'edit'
    end
  end
  
  def edit
    @atleta = Atleta.find(current_user.atleta_id)
    @treino = Treino.find(params[:id])
  end

  def show
    @atleta = Atleta.find(current_user.atleta_id)
    @treino = Treino.find(params[:id])
    @itens_treino = @treino.itens_treino
  end
  
  
end
