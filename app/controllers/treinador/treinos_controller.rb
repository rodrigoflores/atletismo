class Treinador::TreinosController < ApplicationController
  def index
    @treinos = Atleta.find(params[:atleta_id]).treinos
  end
  
  def new
    @treino = Atleta.find(params[:atleta_id]).treinos.new
  end
end
