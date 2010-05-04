class SomatorioDeCargasController < ApplicationController
  
  before_filter :user_is_treinador?

  
  def show
    @atletas = Atleta.find_by_treinador_id(current_treinador)
  end

end
