class Teste < ActiveRecord::Base
  belongs_to :atleta


  validates_numericality_of :segundos, :less_than => 60, :message => " deve ser menor do que 60.", :allow_nil => true
  validates_numericality_of :decimos, :less_than => 10, :message => " deve ser menor do que 10.", :allow_nil => true
  validates_presence_of :nome

  def resultado
    tmp = ["","",""]
    tmp[0] << "#{self.minutos}' " if (self.minutos != nil) && self.minutos != 0
    tmp[0] << "#{self.segundos}'' "  if (self.segundos != nil) && self.segundos != 0
    tmp[0] << "#{self.decimos}"  if (self.decimos != nil) && self.decimos != 0
    tmp.delete("")
    return tmp.join " | "
  end

end
