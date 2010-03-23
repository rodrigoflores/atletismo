class Prova < ActiveRecord::Base
  belongs_to :atleta
  
  attr_accessible :competicao, :data, :horas, :minutos, :segundos, :decimos, 
  				  :competicao, :atleta, :comentarios, :colocacao, :clima, :distancia, :tipoTempo, :periodo, :cor

  validate :default_values

  #validates_format_of  :colocacao , :with =>  /^[0-9]*\z/ , :message => "deve ser números"
  validates_numericality_of :colocacao, :more_than => 0, :message => " deve ser números."
  validates_numericality_of :minutos, :less_than => 60, :message => " deve ser menor do que 60."
  validates_numericality_of :segundos, :less_than => 60, :message => " deve ser menor do que 60."
  validates_numericality_of :decimos, :less_than => 10, :message => " deve ser menor do que 10."


  def default_values
    self.horas = 0 if self.horas.nil?
    self.minutos = 0 if self.minutos.nil?
    self.segundos = 0 if self.segundos.nil?
    self.decimos = 0 if self.decimos.nil?
  end

  def tempo
    tmp = ""
    tmp << "#{self.horas} h " if self.horas && self.horas != 0
    tmp << "#{self.minutos}' " if self.minutos && self.minutos != 0
    tmp << "#{self.segundos}'' " if self.segundos && self.segundos != 0
    tmp << "#{self.decimos}" if self.decimos && self.decimos != 0
    return tmp
  end
  
  def tempo_em_decimos
    return 10*(60*self.minutos+self.segundos)+self.decimos
  end
  
  def tempo_em_minutos
    min = self.minutos if self.minutos
    min += self.segundos/60.0 if self.segundos
    min += self.horas*60.0 if self.horas
    return min
  end
  
  
end


