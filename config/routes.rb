ActionController::Routing::Routes.draw do |map|
 
 #Users
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.forgot_password_request '/forgot_password', :controller => 'users', :action => 'forgot_password_request'
  map.reset_password '/reset_password/:id', :controller => 'users', :action => 'reset_password_request'      


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
  map.resources :atletas, :has_many => :provas
  map.resources :atletas, :has_many => :testes
  map.resource :treinador
  
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
