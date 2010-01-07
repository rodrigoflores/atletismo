class ItemTreino < ActiveRecord::Base
  belongs_to :treino
  belongs_to :cor_treino
  
end
