class Treino < ActiveRecord::Base
  belongs_to :atleta
  has_many :itens_treino, :class_name => "ItemTreino"
  validates_presence_of :date
end
