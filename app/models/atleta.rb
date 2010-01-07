class Atleta < ActiveRecord::Base
 
=begin
  def provasQueParticipa
    if provasParticipa.empty?
      provasQueParticipa = "Nenhuma"
    else
      provasQueParticipa = provasParticipa 
    end
    return provasQueParticipa
 end
=end
  
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
 
 has_one :treinador
   
 has_many :participa_provas
  
end
