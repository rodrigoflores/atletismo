class Treinador::TestesController < ApplicationController

  def index
    @atleta = Atleta.find(params[:atleta_id])
    @testes = @atleta.testes   
  end
  
  def new
    @atleta = Atleta.find(params[:atleta_id])
    @teste = @atleta.testes.new
  end
  
  def edit
    @atleta = Atleta.find(params[:atleta_id])
    @teste = Teste.find(params[:id])
  end
  
  def show
    @atleta = Atleta.find(params[:atleta_id])
    @teste = @atleta.testes.find(params[:id])
  end
  
  def create
    @atleta = Atleta.find(params[:atleta_id])
    @teste = @atleta.testes.new(params[:teste])
    if @teste.save
      redirect_to treinador_atleta_testes_path(@atleta)
    else
      render "new"
    end
  end
  
  def update
    @atleta = Atleta.find(params[:atleta_id])
    @teste = @atleta.testes.find(params[:id])
    if @teste.update_attributes(params[:teste])
      redirect_to treinador_atleta_testes_path(@atleta)
    else
      render "edit"
    end
  end
  
  def destroy
    @atleta = Atleta.find(params[:atleta_id])
    @teste = @atleta.testes.find(params[:id])
    @teste.destroy
    redirect_to treinador_atleta_testes_path(@atleta)    
  end
end
