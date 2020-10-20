class ApplicationController < ActionController::Base
    helper_method [:current_user, :logged_in?, :set_session]

    def current_user
        current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end

    def set_session
      session[:user_id] = @user.id
  end

end
