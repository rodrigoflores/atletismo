# This controller handles the login/logout function of the site.  
class UserSessionsController < ApplicationController

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save 
      flash[:notice] = "Login efetuado com sucesso."
      if is_first_time?
         redirect_to edit_atleta_path(Atleta.find(current_user.atleta_id))
      else
        redirect_to "/"
      end
    else
      flash[:error] = "Email ou senha inválidos."
      redirect_to "/"
    end
    
  end

  def destroy
    if @user_session = UserSession.find
      @user_session.destroy 
      redirect_to "/"
    end
  end

end
