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

  def edit
    @treinadores = Treinador.find(:all)
    @atleta = Atleta.find(current_atleta)
  end

  def update
    @atleta = Atleta.find(current_atleta)
    if @atleta.update_atleta(params[:atleta])
      flash[:notice] = "Atleta foi atualizado com sucesso."
      redirect_to(@atleta)
    else
      @treinadores = Treinador.find(:all)
      @atleta = Atleta.find(current_atleta)
      render "edit"
    end
  end
  
# Redirects devem ser definidos no routes.rb. não há necessidade de ter estes métodos aqui.
# Foram mantidos até que os problemas de quebra por utilização sejam resolvidos.
# Long story short: apague isto assim que ver!
#  def redirect_testes
#    redirect_to atleta_testes_path(@atleta)
#  end
#  
#  def redirect_treinos
#    redirect_to :controller => "treino", :action => "treino_atleta", :atleta_id => @atleta 
#  end
#  
#  def redirect_provas
#    redirect_to atleta_provas_path(@atleta)
#  end
end
