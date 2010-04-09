class User < ActiveRecord::Base
  acts_as_authentic

  def activate
    self.activated_at = Time.now.utc
    self.reset_perishable_token!
    self.save
  end

  protected
  def after_create
    if self.treinador?
      treinador = Treinador.new
      treinador.user_id = self.id
      treinador.save
      self.treinador_id = treinador.id
    else
      atleta = Atleta.new
      atleta.user_id = self.id
      atleta.save
    end
  end
  
end
