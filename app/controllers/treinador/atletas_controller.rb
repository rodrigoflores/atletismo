class Treinador::AtletasController < ApplicationController
  def index
    @atletas = Atleta.find_all_by_treinador_id(Treinador.first.id)
  end
end
