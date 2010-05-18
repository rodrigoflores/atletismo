class Treinador::AtletasController < ApplicationController
  def index
    @atletas = Atleta.find_all_by_treinador_id(Treinador.first.id)
  end
  
  def somatorio_de_cargas
    data_inicial = Date.parse("#{params[:somatorio_de_carga]["data_inicial(3i)"]}-#{params[:somatorio_de_carga]["data_inicial(2i)"]}-#{params[:somatorio_de_carga]["data_inicial(1i)"]}")
    data_final = Date.parse("#{params[:somatorio_de_carga]["data_final(3i)"]}-#{params[:somatorio_de_carga]["data_final(2i)"]}-#{params[:somatorio_de_carga]["data_final(1i)"]}")
    @atleta = Atleta.find(params[:id])
    @resultado = Treino.somatorio_de_cargas(@atleta, data_inicial, data_final)
  end
end
