class Exercicio < ActiveRecord::Base
  belongs_to :treinador
  has_many :itens_treino

  validates_presence_of :exercicio, :unidade, :treinador_id
end
