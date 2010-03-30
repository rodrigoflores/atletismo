# This controller handles the login/logout function of the site.  
class UserSessionsController < ApplicationController

  def new 
    @user_session = UserSession.new  
  end

  def create
    if @user_session = UserSession.find
      @user_session.destroy 
    end
    unless @user_session = UserSession.find
      @user_session = UserSession.new(params[:user_session])
      flash[:notice] = "Login efetuado com sucesso." if @user_session.save
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
