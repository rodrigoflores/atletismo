class TestesController < ApplicationController
  
  before_filter :require_login  

  active_scaffold :testes do |config|
    config.label = "Testes"
    list.sorting = {:data => 'DESC' } 
    config.columns = [:nome,:data,:clima,:periodo,:resultado]
    config.list.columns.exclude :association_column  
    #Label
    config.columns[:data].label = "Data"
    config.columns[:periodo].label = "Período"
    config.columns[:resultado].label = 'Resultado'
    #Search
    config.search.columns << :metros
    config.search.columns << :centimetros
    config.search.columns << :minutos
    config.search.columns << :segundos
    config.search.columns << :decimos
    config.search.columns << :kg
    config.search.columns << :data
    
    config.action_links.add "graphic",
    :type => :table,
    :label => "Gráfico",
    :inline => false
  end
    
  def show
    @teste = Teste.find(params[:id])
    render :active_scaffold => 'Testes'
  end
  
  def new
    @teste = Teste.new
    render :active_scaffold => 'Testes'
  end
  
  def edit
    @teste = Teste.find(params[:id])
    render :active_scaffold => 'Testes'    
  end
  
  def create
    @teste = Teste.new(params[:teste])
    if params[:atleta_id] 
      @teste.atleta_id = params[:atleta_id]
    end
    if @teste.save
      flash[:notice] = 'Teste foi criado com sucesso.'
      @testes = Teste.find(:all, :conditions => {:atleta_id => @teste.atleta_id})
      redirect_to atleta_testes_path(@testes);
    else
      render :action => "new"
    end
  end


  def update
    @teste = Teste.find(params[:id])
    
    if @teste.update_attributes(params[:teste])
      flash[:notice] = 'Teste foi atualizado com sucesso.'
      redirect_to atleta_testes_path(@atleta);     
    else
      render :action => "edit" 
    end
  end
  
  protected
  
  # Segurança
  def get_atleta
    if (user_is_treinador?)
      @atleta = Atleta.find(params[:atleta_id])
    else      
      if @atleta = Atleta.find(params[:atleta_id]) == current_atleta
        @atleta = current_atleta
      else
        flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
        redirect_to root_path()
      end
    end
  end
    
  # para tirar os links de edicao na tela do treinador
  def create_authorized?
    user_is_atleta?
  end
  def update_authorized?
    user_is_atleta?
  end
  def delete_authorized?
    user_is_atleta?
  end
    
end
