class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.  
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
