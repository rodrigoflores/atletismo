class UserSession < Authlogic::Session::Base
  validate :must_be_activated

  def must_be_activated
    @user = User.find_by_email(self.email)
    if @user
      errors.add("Consulte seu e-mail e ative sua conta") unless @user.activated?
    end
  end

end
