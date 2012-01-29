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
    tmp << "#{self.horas} h " if (self.horas != nil) && self.horas != 0
    tmp << "#{self.minutos}' " if (self.minutos != nil) && self.minutos != 0
    tmp << "#{self.segundos}'' " if (self.segundos != nil) && self.segundos != 0
    tmp << "#{self.decimos}" if (self.decimos != nil) && self.decimos != 0
    return tmp
  end

  def tempo_em_decimos
    dec = 0
    dec += 3600*self.horas if (self.horas != nil)
    dec += 60*self.minutos if (self.minutos != nil)
    dec += self.segundos if (self.segundos != nil)
    dec = dec*10
    dec += self.decimos if (self.decimos != nil)

    return dec
  end

  def tempo_em_minutos
    min = 0
    min += 60*self.horas if (self.horas != nil)
    min += self.minutos if (self.minutos != nil)
    min += (1.0/60)*self.segundos if (self.segundos != nil)
    min += (1.0/600)*self.decimos if (self.decimos != nil)
    min *= 1000
    min = min.floor()
    min /= 1000.0

    return min
  end
end
