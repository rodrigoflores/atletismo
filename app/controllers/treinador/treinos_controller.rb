class Treinador::TreinosController < ApplicationController
  def index
    @treinos = Atleta.find(params[:atleta_id]).treinos
  end
  
  def new
    @treino = Atleta.find(params[:atleta_id]).treinos.new
  end
  
  def update
    @atleta = Atleta.find(params[:atleta_id])
    @treino = @atleta.treinos.find(params[:id])
    if @treino.update_attributes(params[:treino])
      redirect_to treinador_atleta_treinos_path(@atleta)
    else
      render 'edit'
    end
  end
  
  def edit
    @atleta = Atleta.find(params[:atleta_id])
    @treino = Treino.find(params[:id])
  end
  
  def create
    @atleta = Atleta.find(params[:atleta_id])
    @treino = @atleta.treinos.new(params[:treino])
    if @treino.save
      redirect_to treinador_atleta_treino_path(@atleta,@treino)
    else
      render 'new'
    end
  end
  
  def destroy
    @atleta = Atleta.find(params[:atleta_id])  
    @treino = Treino.find(params[:id])
    @treino.delete
    redirect_to treinador_atleta_treinos_path(@atleta)
  end
  
  def show
    @treino = Treino.find(params[:id])
  end
end
