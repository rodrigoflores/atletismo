class PreferenciasController < ApplicationController
  
  def mostraPeriodoCor    
    @corPeriodo = CorPeriodo.findPeriodoCor(self.current_user)
  end

  def mostraTipoTreinoCor
    @corTreino = CorTreino.findTreinoCor(self.current_user)
  end 

  def novoPeriodoCor
      @corPeriodo = CorPeriodo.new
  end

  def novoTipoTreinoCor
      @corTreino = CorTreino.new
  end


  def criaPeriodoCor
    @corPeriodo = CorPeriodo.new(params[:cor_periodo])
    if @corPeriodo.save
      redirect_to :action => "mostraPeriodoCor"
    else
      render :action => "novoPeriodoCor" 
    end
  end

  def criaTreinoCor
    @corTreino = CorTreino.new(params[:cor_treino])
    @corTreino.save
    
    redirect_to :action => "mostraTipoTreinoCor"
  end

  def removePeriodoCor
    @corPeriodo = CorPeriodo.find(params[:id])
    @corPeriodo.cor = "FFFFFF"
    @corPeriodo.save 
    redirect_to :action => "mostraPeriodoCor"
  end

  def removeTipoTreinoCor
    @corTreino = CorTreino.find(params[:id])
    @corTreino.cor = "FFFFFF"
    @corTreino.save
    redirect_to :action => "mostraTipoTreinoCor"
  end

  def alterarTipoTreinoCor 
    @corTreino = CorTreino.find(params[:id])
  end

  def atualizaTipoTreinoCor
    @corTreino = CorTreino.find(params[:id])
    @corTreino.tipo = params[:cor_treino][:tipo]
    @corTreino.cor = params[:cor_treino][:cor] 
    @corTreino.save
    redirect_to :action => "mostraTipoTreinoCor"
  end

  def alterarPeriodoCor
    @corPeriodo = CorPeriodo.find(params[:id])
  end
  
  def atualizaPeriodoCor
    @corPeriodo = CorPeriodo.find(params[:id])
    @corPeriodo.periodo = params[:cor_periodo][:periodo]
    @corPeriodo.cor = params[:cor_periodo][:cor] 
    @corPeriodo.save
    redirect_to :action => "mostraPeriodoCor"
  end


end
