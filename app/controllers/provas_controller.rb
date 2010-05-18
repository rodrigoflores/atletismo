class ProvasController < ApplicationController
  
  before_filter :require_login
  before_filter :provas_distancia_form
  
  
  active_scaffold :prova do |config|
    config.label = "Provas"
    config.columns = [:competicao, :data, :distancia, :tempo, :tipoTempo, :clima]
    list.sorting = {:data => 'ASC' } 
 
    # Label
    columns[:competicao].label = "Competição"
    columns[:data].label = "Data"
    columns[:distancia].label = "Distância (m)"
    columns[:tipoTempo].label = "Tipo Tempo"
    columns[:tempo].sort_by :method => 'tempo_em_decimos'
    columns[:clima].label = "Clima"
    config.list.columns.exclude :association_column  
    
    config.action_links.add "graphic",
    :type => :table,
    :label => "Gráfico",
    :inline => false
    
    # Search
    config.search.columns << :distancia
    config.search.columns << :minutos
    config.search.columns << :segundos
    config.search.columns << :decimos
    
  end

  def show
    @prova = Prova.find(params[:id])
    render :active_scaffold => 'provas'
  end
  
  def new
    @prova = Prova.new
    render :active_scaffold => 'provas'
    
  end
  
  def edit
    @prova = Prova.find(params[:id])
    render :active_scaffold => 'provas'    
  end
  
  def create
    @prova = Prova.new(params[:prova])
    @atleta = Atleta.find(params[:atleta_id])
    @treinador = Treinador.find(@atleta.treinador_id)

    if params[:atleta_id]
      @prova.atleta_id = params[:atleta_id]
    end
    if @prova.save
      flash[:notice] = 'Prova foi criada com sucesso.'
      @provas = Prova.find(:all, :conditions => {:atleta_id => @prova.atleta_id})
      redirect_to atleta_provas_path(@atleta);     
    else
      render :action => "new"
    end
  end

  def update
    @prova = Prova.find(params[:id])
    if @prova.update_attributes(params[:prova])
      flash[:notice] = 'Prova foi atualizada com sucesso.'
      redirect_to atleta_provas_path(@prova);     
    else
      render :action => "edit" 
    end
  end

  protected
  
  def provas_distancia_form
    @provas_distancia = true
    if params[:distancia]
      @voltar_link = true
      @distancia = params[:distancia]
    end
  end
  
  # opções de active scaffold:
  # para tirar os links de edicao na tela do treinador
  def create_authorized?
    user_is_atleta?
  end
  def update_authorized?
    user_is_atleta?
  end
  
end
