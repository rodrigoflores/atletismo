class UsersController < ApplicationController

  def new
    @user = User.new
    @treinadores = Treinador.find(:all)
  end
 
  def create

  end
 
  def activate

  end

  def forgot_password
  
  end
  
  def forgot_password_request
  
  end
  
  def reset_password_request
 
  end
  
  def reset_password
 
  end
  
end
