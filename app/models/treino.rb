class Treino < ActiveRecord::Base
  
  has_many :item_treino
  
  belongs_to :atleta
  
  validates_uniqueness_of :date, :scope => :atleta_id
  
  attr_accessible :text, :date, :comentario, :itens_treino

  def initialize(params = nil)
    super
    self.text = "" unless self.text != nil
    self.comentario = "" unless self.comentario != nil
  end
   
  def transposeScheduler
  end
  
  def itens_treino
    itens_treino = ItemTreino.find(:all, :conditions => "treino_id = #{self.id}")
    itens_treino
  end 
end
