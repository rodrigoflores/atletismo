ActionController::Routing::Routes.draw do |map|

	map.connect "/treinador/atletas/:id/somatorio_de_cargas", :controller => "treinador/atletas", :action => "somatorio_de_cargas"

  map.namespace :treinador do |treinador|
  	treinador.resources :atletas, :member => { :somatorio_de_cargas => :get },:has_many => [:treinos, :testes, :provas]
  	treinador.resources :treinos, :has_many => :itens_treino, :collection => { :calcula_ritmo_inicial => :get }
  	treinador.root :controller => 'welcome', :action => 'index'
  end

  map.namespace :atleta do |atleta|
  	atleta.resources :treinos
  	atleta.resources :provas
  	atleta.resources :testes
  	atleta.resource :profile
  	atleta.root :controller => 'profiles', :action => 'show'
  end 

 #Users
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.forgot_password_request '/forgot_password', :controller => 'users', :action => 'forgot_password_request'
  map.reset_password '/reset_password/:perishable_token', :controller => 'users', :action => 'reset_password_request'

  map.connect "preferencia/mostraPeriodo", :controller => "preferencias", :action => "mostraPeriodoCor" 
  map.connect "preferencia/novoPeriodoCor", :controller => "preferencias", :action => "novoPeriodoCor" 
  
  map.connect "preferencia/mostraTipoTreino", :controller => "preferencias", :action => "mostraTipoTreinoCor" 
  map.connect "preferencia/novoTipoTreinoCor", :controller => "preferencias", :action => "novoTipoTreinoCor" 

  map.resources :cor_periodos
  map.resources :cor_treinos
#Regras
  map.resources :itens_treino, :singular => :item_treino 

 #Filtro de distancia
  map.connect 'atletas/ranking/:distancia', :controller => 'atletas', :action => 'ranking'
  map.connect 'atletas/:atleta_id/provas/distancia/', :controller => 'provas', :action => 'distancia'
  
  map.connect 'atletas/list/', :controller => 'atletas', :action => 'list'

 #Routes padrão
  map.resources :users
  map.resource  :user_session
  #map.resources :atletas, :has_many => :provas
  map.resources :atletas, :has_many => :testes
  map.resource :treinador
  map.resources :treinos, :collection => { :calcula_ritmo_inicial => :get }  
  
  

   map.root :controller => "welcome"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
