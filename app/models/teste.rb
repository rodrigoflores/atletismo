class Teste < ActiveRecord::Base
  belongs_to :atleta
  
  attr_accessible :nome, :data, :minutos, :segundos, :decimos, :atleta, :comentarios, :clima, :periodo, :metros, :centimetros, :kg
  
  
  validate :default_values
  validates_numericality_of :segundos, :less_than => 60, :message => " deve ser menor do que 60."
  validates_numericality_of :decimos, :less_than => 10, :message => " deve ser menor do que 10."
  validates_numericality_of :centimetros, :less_than => 100, :message => " deve ser menor do que 100."
  validates_presence_of :nome
  
  def default_values
    self.minutos = 0 if self.minutos.nil?
    self.segundos = 0 if self.segundos.nil?
    self.decimos = 0 if self.decimos.nil?
    self.kg = 0 if self.kg.nil?
    self.metros = 0 if self.metros.nil?    
    self.centimetros = 0 if self.centimetros.nil?
  end
  
  def resultado
    tmp = ["","",""]
    tmp[0] << "#{self.minutos}' " if (self.minutos != nil) && self.minutos != 0
    tmp[0] << "#{self.segundos}'' "  if (self.segundos != nil) && self.segundos != 0
    tmp[0] << "#{self.decimos}"  if (self.decimos != nil) && self.decimos != 0
    tmp[1] << "#{self.kg} kg" if (self.kg != nil) && self.kg != 0
    tmp[2] << "#{self.metros} m " if (self.metros != nil) && self.metros != 0
    tmp[2] << "#{self.centimetros} cm" if (self.centimetros != nil) && self.centimetros != 0
    tmp.delete("")
    return tmp.join " | "
  end
  
end
