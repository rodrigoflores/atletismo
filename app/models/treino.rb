class Treino < ActiveRecord::Base
  belongs_to :atleta
  validates_presence_of :date
end
