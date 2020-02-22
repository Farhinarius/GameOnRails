class UsersController < ApplicationController
  # Не дать залогиненному пользователю перейти на страницу регистрации
  before_action :deny_access_to_authorized, only: %i[new create]
  before_action :authorize, only: %i[profile]
  
  def new; end 

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/', success: 'You Signed In Succesfully.'
    else
      redirect_to '/signup', danger: 'The E-Mail or Username is already taken'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
