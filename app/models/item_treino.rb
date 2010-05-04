class ItemTreino < ActiveRecord::Base
  belongs_to :treino
  belongs_to :cor_treino
  validates_presence_of :volume, :grandeza
  validates_numericality_of :volume
  validates_numericality_of :series, :repeticao, :pausa, :intervalo, :segundos, :minutos, :decimos, :allow_nil => true
end
