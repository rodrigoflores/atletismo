class ItemTreino < ActiveRecord::Base
  belongs_to :treino
  belongs_to :cor_treino
  validates_presence_of :volume, :grandeza
end
