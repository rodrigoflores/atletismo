class ProvasController < ApplicationController
  
  before_filter :login_required
  before_filter :get_atleta_com_seguranca
  before_filter :treinador_prohibited, :only => [:new, :edit, :create, :update]
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




  def graphic
    if params[:distancia]
      @provas = Prova.find(:all, :conditions => {:atleta_id => @atleta.id, :distancia => params[:distancia]}, :order => "data ASC")
    else
      @provas = Prova.find(:all, :conditions => {:atleta_id => @atleta.id}, :order => "data ASC")
    end
    
    times = Array.new
    dates = Array.new
    num_dates = Array.new
    datesLabels = String.new
    i = 0
    max = 0
    @provas.each do |prova|
      times[i] = prova.tempo_em_minutos
      max = prova.tempo_em_minutos if max < prova.tempo_em_minutos
      num_dates[i] = "#{i+1}"
      dates[i] = "#{prova.data}"
      datesLabels += "\"#{dates[i]}\" #{num_dates[i]}"
      datesLabels += ", " if i != (@provas.size - 1)
      puts "Data: #{dates[i]} - Minutos: #{times[i]}"
      i += 1
      
    end
    

    Gnuplot.open do |gp|
      Gnuplot::Plot.new( gp ) do |plot|
        plot.output "'public/images/teste.png'"
        plot.terminal "png"
        plot.xrange "[0:#{i+1}]"
        plot.xtics "(#{datesLabels})"
        plot.xlabel "Data"
        plot.ylabel "Tempo (minutos)"
        #plot.yrange "[0:#{max}]"

        num_dates.each do |d|
          puts d
          x = ["#{d}"]
          y = ["#{max}"]
          plot.data << Gnuplot::DataSet.new( [x,y] ) do |ds|
            ds.with = "boxes lt #{d} lw 2"
            ds.notitle
          end
        end
        
        plot.data << Gnuplot::DataSet.new( [num_dates, times] ) do |ds|
          ds.with = "linespoints"
          ds.linewidth = 2
          ds.notitle
        end

      end
    end
    @teste = 'teste.png'
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
    p @prova
    if @prova.update_attributes(params[:prova])
      flash[:notice] = 'Prova foi atualizada com sucesso.'
      redirect_to atleta_provas_path(@atleta);     
    else
      render :action => "edit" 
    end
  end
  
  
  
  def distancia
    @condition = "distancia = #{params[:distancia]}" 
    index
  end
  
  def conditions_for_collection
    @condition
  end
  
  
  protected
  
  def provas_distancia_form
    @provas_distancia=true
    if params[:distancia]
      @voltar_link=true
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
  def delete_authorized?
    user_is_atleta?
  end
  
end
