class Treinador::AtletasController < ApplicationController
  def index
    @atletas = Atleta.find_all_by_treinador_id(Treinador.first.id)
  end
  
  def somatorio_de_cargas
    data_inicial = params[:somatorio_de_carga][:data_inicial]
    data_final = params[:somatorio_de_carga][:data_final]
    @atleta = Atleta.find(params[:id])
    @resultado = Treino.somatorio_de_cargas(@atleta, data_inicial, data_final)
  end
end
