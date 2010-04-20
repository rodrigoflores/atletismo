class AtletasController < ApplicationController
  
  before_filter :require_login

  
  active_scaffold :atleta do |config|
    config.label = "Atletas"
    config.actions.exclude :create, :update, :delete, :show
    config.columns = [:nome, :nasc, :peso, :altura]
    columns[:nome].sort_by  :method => 'nome'
    list.sorting = {:nome => 'ASC' }
    config.columns[:nome].search_sql = 'nome'
    config.search.columns << :nome
  end
  
  def index
  end
  
  
  def show
    if user_is_treinador?
      render :active_scaffold => "show"
    else
      @atleta = Atleta.find_by_user_id(current_user.id)
    end
  end
  
  
  def showProvas
    @provas = @atleta.provas
  end
  
  
  def edit
    @treinadores = Treinador.find(:all)
    @atleta = Atleta.find(current_atleta)
  end
  
  
  def update
    participa_provas = [];
    if params[:atleta][:participa_provas].nil?
        params[:atleta][:participa_provas] = []
    end
    @atleta = Atleta.find(current_atleta)
    for participa_prova_string in params[:atleta][:participa_provas] do
      if integer? participa_prova_string 
        pp = ParticipaProva.find(participa_prova_string)
      else 
        pp = ParticipaProva.new(:atleta_id => current_atleta.id, :nome => participa_prova_string)
      end
      participa_provas <<  pp
    end
    params[:atleta][:participa_provas] = participa_provas
    if @atleta.update_attributes(params[:atleta])
      flash[:notice] = 'Atleta foi atualizado com sucesso.'
      redirect_to(@atleta) 
    else
      render :action => "edit" 
    end
  end
  
  
  def redirect_testes
    redirect_to atleta_testes_path(@atleta)
  end
  
  def redirect_treinos
    redirect_to :controller => "treino", :action => "treino_atleta", :atleta_id => @atleta 
  end
  
  def redirect_provas
    redirect_to atleta_provas_path(@atleta)
  end
  
  
  #Ranking
  def search_ranking
  end
  
  def ranking
    @distancia = params[:distancia]
    
    #@treinador = Treinador.find_by_user_id(current_user)
    #@atletas = Atleta.find_all_by_treinador_id(@treinador)
    @atletas = Atleta.find(:all)
    @provas = []
    @atletas.each do |atleta|
      @provas << Provas.find(:all, :conditions => {:distancia => @distancia, :atleta_id => atleta.id})
    end
    @provas
  end
  
  
  #Seleção dos atletas do treinador atualmente logado
  #Isso é automaticamente chamado por active scaffold
  def conditions_for_collection
    if (user_is_treinador?)
      @condition = "atletas.treinador_id = #{Treinador.find_by_user_id(current_user).id}"
    else
      flash[:alert] = "Erro: Você não tem acesso a essa página"
      redirect_to root_path()
    end 
    
    #['user_type IN (?)', ['admin', 'sysop']]
  end
  
  protected
  
  # Segurança
  def get_atleta
    if (user_is_treinador?)
      @atleta = Atleta.find(params[:id])
    else      
      if Atleta.find(params[:id]) == current_atleta
        @atleta = current_atleta
      else
        flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
        redirect_to root_path()
      end
    end
  end
  
  def integer?(object)
    true if Integer(object) rescue false
  end

  private :integer?
  
  
end
