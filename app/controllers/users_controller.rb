class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  
  
  def new
    @user = User.new
    @treinadores = Treinador.find(:all)
  end
 
def create
  logout_keeping_session!
  @user = User.new(params[:user])
  success = @user && @user.save
  if success && @user.errors.empty?
    # Protects against session fixation attacks, causes request forgery
    # protection if visitor resubmits an earlier form using back
    # button. Uncomment if you understand the tradeoffs.
    # reset session
    if(@user.atleta)
      @atleta = Atleta.new
      @atleta.user_id = @user.id
      @atleta.treinador_id = params[:atleta][:treinador_id] if params[:atleta][:treinador_id]
      @atleta.save!
    else
      @treinador = Treinador.new
      @treinador.user_id = @user.id
      @treinador.save!
    end
    redirect_to "/"
    flash[:notice] = "Obrigado por se registrar!  Enviaremos em questão de minutos um e-mail com seu código de ativação."
   else
      @treinadores = Treinador.find(:all)
      render :action => 'new'
    end
  end
 
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Ativação feita com sucesso! Por favor, faça login para continuar."
      redirect_to '/'
    when params[:activation_code].blank?
      flash[:error] = "O código de ativação está faltando. Por favor, entre no link enviado no seu e-mail."
      redirect_back_or_default('/')
    when 
      flash[:error]  = "Não pudemos encontrar um usuário com seu código de ativação -- Verifique seu e-mail, ou talvez você já esteja ativado - tente fazer o login"
      redirect_back_or_default('/')
    end
  end

  def forgot_password
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user.forgot_password
      @user.save
      redirect_back_or_default('/')
      flash[:notice] = "Um link para redefinir sua senha foi enviado ao seu e-mail"
    else
      flash[:alert] = "Não foi possível achar um usuário com esse e-mail"
    end
  end
  
  def forgot_password_request
    @user = User.find_by_password_reset_code(params[:id])
  end
  
  def reset_password_request
    @user = User.find_by_password_reset_code(params[:id])
    unless @user
     flash[:notice] = "Esta chave de redefinição de senha não existe. Por acaso você já não redefiniu a senha?"
     redirect_back_or_default('/')
    end
    
  end
  
  def reset_password
    @user = User.find_by_password_reset_code(params[:user][:password_reset_code])
    if ((params[:user][:password] && params[:user][:password_confirmation]) && !params[:user][:password_confirmation].blank?)
      self.current_user = @user
      current_user.password_confirmation = params[:user][:password_confirmation]
      current_user.password = params[:user][:password]
      @user.reset_password
      flash[:notice] = current_user.save ? "Redefinição da senha feita com sucesso." : "Redefinição da senha não foi realizada." 
      redirect_back_or_default('/')
    else
      flash[:alert] = "Senha e confirmação não coincidem."
    end  
  end
  
end
