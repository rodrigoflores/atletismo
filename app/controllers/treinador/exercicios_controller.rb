class Treinador::ExerciciosController < ApplicationController

  def index
    @exercicios = Exercicio.find(:all, :conditions => {:treinador_id => current_treinador})
  end

  def new
    @exercicio = Exercicio.new
  end

  def create
    @exercicio = Exercicio.new(params[:exercicio])
    @exercicio.treinador_id = Treinador.find(current_user.treinador_id).id
    if @exercicio.save
      redirect_to treinador_exercicios_path
    else
      render "new"
    end
  end

  def edit
    @exercicio = Exercicio.find(params[:id])
  end

  def update
    @exercicio = Exercicio.find(params[:id])
    if @exercicio.update_attributes(params[:exercicio])
      redirect_to treinador_exercicios_path
    else
      render "edit"
    end
  end

end
