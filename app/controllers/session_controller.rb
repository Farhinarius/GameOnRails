class SessionController < ApplicationController
  # Не дать залогиненному пользователю перейти на страницу входа
  before_action :deny_access_to_authorized, only: %i[new create]

  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', success: 'You Signed In Succesfully.'
    else
      redirect_to '/login', danger: 'Invalid login or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', warning: 'You have been logged out.'
  end
end
