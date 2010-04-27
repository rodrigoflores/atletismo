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

#  def showProvas
#    @provas = @atleta.provas
#  end

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
  end

#  protected

#  # Segurança
#  def get_atleta
#    if (user_is_treinador?)
#      @atleta = Atleta.find(params[:id])
#    else      
#      if Atleta.find(params[:id]) == current_atleta
#        @atleta = current_atleta
#      else
#        flash[:alert] = "Erro: Você não tem acesso à página "+request.request_uri
#        redirect_to root_path()
#      end
#    end
#  end



end
