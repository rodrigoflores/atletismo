class Treinador < ActiveRecord::Base
  has_one :user
  has_many :cor_treinos
  has_many :cor_periodos
  has_many :atletas
<<<<<<< HEAD:app/models/treinador.rb
  has_many :objetivos
=======
  has_many :exercicios
>>>>>>> c429efd2e74c3abdb00c0da10f3b9e2ba46353ab:app/models/treinador.rb
  
  def usuario 
    @user = User.find(self.user_id) if(self.user_id)
  end

end
