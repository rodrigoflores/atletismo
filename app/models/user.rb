class User < ActiveRecord::Base
  acts_as_authentic


  def activate
    self.activated = true
    self.reset_perishable_token!
    self.save
  end

  protected

  def after_create
    self.activated = false
    self.activated_at = nil
    if self.treinador?
      treinador = Treinador.new
      treinador.user_id = self.id
      treinador.save
      self.treinador_id = treinador.id
    else
      atleta = Atleta.new
      atleta.user_id = self.id
      atleta.treinador_id = self.treinador_id
      atleta.save
      self.atleta_id = atleta.id
      self.treinador_id = nil
    end
    self.save
    UserSession.find.destroy
  end

end
