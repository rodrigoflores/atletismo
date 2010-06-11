class Objetivo < ActiveRecord::Base

  belongs_to :treinador
  validates_presence_of :nome
  
  has_many :itens_treino
  
end
