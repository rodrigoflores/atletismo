ActionController::Routing::Routes.draw do |map|

	map.connect "/treinador/atletas/:id/somatorio_de_cargas", :controller => "treinador/atletas", :action => "somatorio_de_cargas"

  map.namespace :treinador do |treinador|
  	treinador.resources :atletas, :member => { :somatorio_de_cargas => :get },:has_many => [:treinos, :testes, :provas]
  	treinador.resources :treinos, :has_many => :itens_treino, :collection => { :calcula_ritmo_inicial => :get }
  	treinador.resource :profile
  	treinador.root :controller => 'profiles', :action => 'show'
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
  

 #Routes padrão
  map.resources :users, :collection => { :forgot_password => :get, :reset_password_request => :get,  :reset_password => :get }
  map.resource  :user_session
  #map.resources :atletas, :has_many => :provas
  
  

   map.root :controller => "welcome"

end
