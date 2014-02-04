class CorPeriodo < ActiveRecord::Base
  belongs_to :treinador
  validate :periodoValido

  def periodoValido
    if self.fim < self.inicio
      errors.add_to_base("Fim deve ser maior que início.")
    end
  end

  def self.findPeriodoCor(user)
    treinador = Treinador.find_by_user_id(user)
    @corPeriodo = CorPeriodo.find(:all, :conditions => {:treinador_id => treinador.id})
  end
end
