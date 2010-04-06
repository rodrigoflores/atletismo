class User < ActiveRecord::Base
  acts_as_authentic
  protected
  def after_create
    if self.treinador?
      treinador = Treinador.new
      treinador.user_id = self.id
      treinador.save
    else
      atleta = Atleta.new
      atleta.user_id = self.id
      atleta.save
    end
  end
  def after_activate
    self.activated_at = Time.now.utc
    self.save
  end
end
