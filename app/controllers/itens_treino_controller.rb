class ItensTreinoController < ApplicationController
  def index
    @itensTreino = ItemTreino.find(:all)
  end

  def new
    @itemTreino = ItemTreino.new    
  end

  def create
    tipo = params[:treinador][params[:treino_id].to_s][:tipo].strip
    t = current_treinador
    c = CorTreino.find(:first, :conditions => ["Lower(tipo) like ? and treinador_id = ?" , "%#{tipo.downcase}%", t]) if tipo != ""
    @itemTreino = ItemTreino.new(params[:itens][params[:treino_id].to_s])
    @itemTreino.treino_id = params[:treino_id][0].to_i

    @itemTreino.cor_treino = c

    if c.nil?
      c = CorTreino.new
      c.tipo = tipo
      c.cor = "FFFFFF"
      c.treinador_id = t
      c.save
      @itemTreino.cor_treino = c
    end
 
    @itemTreino.save
    render :partial => 'tabela_itens', :locals => { :treino => @itemTreino.treino, :show => true }
  end

  def destroy
   @itemTreino = ItemTreino.find(params[:id])
   @itemTreino.destroy
   render :partial => 'tabela_itens', :locals => { :treino => @itemTreino.treino, :show => true }
  end
  
  def edit
    @itemTreino = ItemTreino.find(params[:id])
  end
  
  def update
    @itemTreino = ItemTreino.find(params[:id])
    @itemTreino.update_attributes(params[:itemTreino])
    redirect_to :action => "index" 
  end
  
end
