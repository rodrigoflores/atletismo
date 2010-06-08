class Exercicio < ActiveRecord::Base
  belongs_to :treinador
  
  validates_presence_of :exercicio, :unidade, :treinador_id
end
