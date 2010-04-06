class WelcomeController < ApplicationController
  def index
    @hide_home_link = true
    if user_is_treinador?
      redirect_to treinador_path(Treinador.find_by_user_id(current_user.id))
    elsif user_is_atleta?
      redirect_to :controller => :atletas
    end
  end

end
