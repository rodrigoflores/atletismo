class WelcomeController < ApplicationController
  def index
    @hide_home_link = true
    if user_is_treinador?
      redirect_to treinador_atletas_path
    elsif user_is_atleta?
      redirect_to atleta_treinos_path
    end
  end

end
