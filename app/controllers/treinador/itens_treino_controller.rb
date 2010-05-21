class Treinador::ItensTreinoController < ApplicationController

  def create
    @treino = Treino.find(params[:treino_id])
    @item_treino = @treino.itens_treino.new(params[:item_treino])
    if @item_treino.save
      redirect_to treinador_atleta_treino_path(@treino.atleta, @treino)
    else
      @atleta = @treino.atleta
      render 'treinador/treinos/show'
    end 
  end
  
  def destroy
    @treino = Treino.find(params[:treino_id])
    @item_treino = @treino.itens_treino.find(params[:id])
    @item_treino.delete
    redirect_to treinador_atleta_treino_path(@treino.atleta, @treino)
  end
end
