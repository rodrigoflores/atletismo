class Atleta < ActiveRecord::Base

  has_one :user
 
  has_many :treinos

  has_many :provas
 
  has_many :testes

  belongs_to :treinador

  has_many :participa_provas
  
  attr_accessible :usuario, :nasc, :treinador_id, :altura,:peso, :provas, :participa_provas
  
  validates_presence_of :treinador_id

  def usuario
    @usuario = User.find(self.user_id) if(self.user_id)
  end
  
  def nome
    usuario.name
  end

	def update_atleta(atleta)
		self.nasc = Time.parse(atleta["nasc(3i)"] + "-" + atleta["nasc(2i)"] + "-" + atleta["nasc(1i)"])
		self.altura = atleta[:altura]
		self.peso= atleta[:peso]
		self.treinador_id = atleta[:treinador_id]
		participa_provas = []
    if atleta[:participa_provas].nil?
        atleta[:participa_provas] = []
    end

    for participa_prova_string in atleta[:participa_provas] do
      if integer?(participa_prova_string)
        pp = ParticipaProva.find(participa_prova_string)
      else 
        pp = ParticipaProva.new(:atleta_id => self.id, :nome => participa_prova_string)
      end
      participa_provas <<  pp
    end
    self.participa_provas = participa_provas
    self.save
	end

	private

  def integer?(object)
    true if Integer(object) rescue false
  end

end
