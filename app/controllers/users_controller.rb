class UsersController < ApplicationController

  def new
    @user = User.new
    @treinadores = Treinador.find(:all)
  end
 
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Usuário cadastrado com sucesso! Aguarde um e-mail de ativação contendo link para ativação"
      redirect_to "/"
    else
      render "new"
    end
  end
 
  def activate
    @user = User.find_by_perishable_token(params[:activation_code])
    if @user
      @user.reset_perishable_token!
      flash[:notice] = "Sua confirmação foi realizada com sucesso"    
    else
      flash[:notice] = "Código de ativação não encontrado"
    end
    redirect_to "/"
  end

  def forgot_password
    if @user = User.find_by_email(params[:user][:email])
      UserMailer.deliver_forgot_password(@user)
      flash[:notice] = "Um link de alteração de senha foi enviado para o seu email"
      redirect_to "/"
    else
      flash[:notice] = "Seu e-mail não foi encontrado em nosso banco de dados"
      render "forgot_password_request"
    end
  end
  
  def forgot_password_request
    @user = User.new
  end
  
  def reset_password_request
    unless @user = User.find_by_perishable_token(params[:reset_password_token])
      flash[:notice] = "Código de alteração de senha não encontrado."
      redirect_to "/"     
    end
  end
  
  def reset_password
    @user = User.find(params[:user][:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Senha alterada com sucesso"
      redirect_to "/"
    else
      redirect_to :action => 'reset_password_request', :reset_password_token => @user.perishable_token
    end
  end
  
end
