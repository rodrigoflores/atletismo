class CorTreino < ActiveRecord::Base
    belongs_to :treinador
    
  def findTreinoCor(user)
    treinador = Treinador.find_by_user_id(user)
    @corTreino = CorTreino.find(:all, :conditions => {:treinador_id => treinador.id})
  end
end
