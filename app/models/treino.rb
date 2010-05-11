class Treino < ActiveRecord::Base
  belongs_to :atleta
  has_many :itens_treino, :class_name => "ItemTreino"
  validates_presence_of :date
  
  def self.somatorio_de_cargas(atleta, data_inicio, data_termino)
    @treinos = atleta.treinos.all(:conditions => [ "date >= ? AND date <= ?", data_inicio, data_termino])
    #treinos_ids = @treinos.map { |item| item.id }
    treinos_ids = Array.new
    for item in @treinos do
      treinos_ids << item.id
    end
    
    @itens_treino = ItemTreino.find(:all, :conditions => [ "treino_id IN (?)", treinos_ids ])
    
    somatorio = { "m" => 0.0, "kg" => 0.0, "unidades" => 0.0 }
  
    for item_treino in @itens_treino do
      somatorio [item_treino.grandeza] += item_treino.series.to_f * item_treino.repeticao.to_f * item_treino.volume.to_f

    end
    
    return somatorio
  end
end
