class Atleta < ActiveRecord::Base
 
  has_one :user
  
  attr_accessible :usuario, :nasc, :treinador_id, :altura,:peso, :provas, :participa_provas
 
  def usuario
    @usuario = User.find(self.user_id) if(self.user_id)
  end
  
  def nome
    usuario.name
  end
  
  has_one :user
 
  has_many :treinos

  has_many :provas
 
  has_many :testes

  belongs_to :treinador

  has_many :participa_provas
  
end
