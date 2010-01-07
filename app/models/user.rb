require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken


  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100, :message => " muito longo."

  #validates_presence_of     :email,   :message => nil
  #validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email, :message => " já cadastrado."
  validates_format_of       :email,    :with => Authentication.email_regex, :message => " inválido."

  before_create :make_activation_code
  validate :user_type


  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.

  attr_accessible :email, :name, :password, :password_confirmation, :treinador, :atleta, :id

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    u = find_by_email(email.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  
  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end
  
  def atleta_id
    @atleta = Atleta.find_by_user_id(self.id)
    return @atleta
  end
  
  def treinador_id
    @treinador = Treinador.find_by_user_id(self.id)
    return @treinador
  end
  
  def user_type
    errors.add_to_base("'Atleta' ou 'Treinador' deve ser escolhido.") if !self.atleta && !self.treinador
    errors.add_to_base("'Atleta' e 'Treinador' não podem ser escolhidos simultaneamente.") if self.atleta && self.treinador
      
  end

  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    self.save
  end
  
  def recently_activated?
    return @activated
  end
  
  def active?
    return self.activation_code.nil?
  end

  def forgot_password
    @forgotten_password = true
    self.make_password_reset_code
  end
  
  def recently_reset_password?
    return @forgotten_password
  end
  
  def reset_password
    self.password_reset_code = nil
    self.save
    @reset_password = true
  end

  protected

  def make_activation_code
    self.activation_code = self.class.make_token
  end

  def make_password_reset_code
    self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end
end
