# This controller handles the login/logout function of the site.  
class UserSessionsController < ApplicationController

  def new 
    @user_session = UserSession.new  
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save 
      flash[:notice] = "Login efetuado com sucesso."
    else
      flash[:error] = "Email ou senha inválidos."
    end
    redirect_to "/"
  end

  def destroy
    if @user_session = UserSession.find
      @user_session.destroy 
      redirect_to "/"
    end
  end

end
