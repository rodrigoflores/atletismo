class Treinador < ActiveRecord::Base
  has_one :user
  has_many :cor_treinos
  has_many :cor_periodos
  has_many :atletas
  has_many :objetivos
  
  def usuario 
    @user = User.find(self.user_id) if(self.user_id)
  end

end
