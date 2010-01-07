# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  end
  
  include AuthenticatedSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store

  protect_from_forgery # :secret => '0e424eb18ba8dbb39a6495b9db6ae638'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default]='%d/%m/%Y'
  
  
  
  helper_method :user_logged_in?, :user_is_treinador?, :user_is_atleta?, :current_atleta, :current_treinador, :get_atleta_com_seguranca
  
  protected

  def user_logged_in?
    session[:user_id]
  end
  
  def user_is_treinador?
    user_logged_in? && current_user.treinador
  end
  
  def user_is_atleta?
    user_logged_in? && current_user.atleta
  end
  
  def current_atleta
    if user_is_atleta?
      current_user.atleta_id
    end   
  end
  
  def current_treinador
    if user_is_treinador?
      current_user.treinador_id
    end
    
  end
  
  # Modificações feitas no arquivo seguinte:
  # /vendor/plugins/restful-authentication/generators/authenticated/templates/authenticated_system.rb
  # Inclui tambem o metodo "access_denied"
  
  def treinador_prohibited
    if (user_is_treinador?)
      flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
      access_denied
      #redirect_to root_path()
    end
  end
  
  def atleta_prohibited
    if (user_is_atleta?)
      flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
      access_denied
      #redirect_to root_path()
    end
  end
  
  
  def get_atleta_com_seguranca
    @atleta = Atleta.find(params[:atleta_id])

    if (user_is_treinador?)
      if @atleta.treinador_id != current_treinador.id
        flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
        access_denied
      end
    else      
      if @atleta != current_atleta
        flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
        access_denied
      end
    end
  end
  
end
