# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store

  protect_from_forgery # :secret => '0e424eb18ba8dbb39a6495b9db6ae638'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default]='%d/%m/%Y'
    
  helper_method :require_login, :require_atleta, :require_treinador, :current_session, :current_user, :user_has_activated?, :is_first_time?, :user_is_treinador?, :user_is_atleta?, :current_atleta, :current_treinador, :get_atleta_com_seguranca
  
  protected

  def require_login
    redirect_to "/" unless current_user
  end

  def require_atleta
    redirect_to "/" unless user_is_atleta?
  end

  def require_treinador
    redirect_to "/" unless user_is_treinador?
  end

  def user_has_activated?
    current_user.activated
  end

  def current_session
    @user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_session && current_session.record
  end
  
  def user_is_treinador?
    @current_user.treinador if current_user
  end
  
  def user_is_atleta?
    @current_user.atleta if current_user
  end
  
  def is_first_time?
    user_is_atleta? && (Atleta.find(current_atleta).altura == nil)
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
  
  
  
end
