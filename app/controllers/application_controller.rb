class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    add_flash_types :danger, :info, :warning, :success
      
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    helper_method :current_user
    
    def authorize
      redirect_to '/login' unless current_user
    end

    # Если пользователь залогинен, то нужно не дать перейти на некоторые страницы
    def deny_access_to_authorized
      redirect_to '/' if current_user
    end

end
