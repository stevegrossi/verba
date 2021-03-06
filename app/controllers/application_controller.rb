class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :require_user

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end
  
  def set_current_user(user_id)
    session[:user_id] = user_id
  end

  def signed_in?
    !current_user.nil?
  end

  def require_user
    unless signed_in?
      redirect_to login_path, notice: "Please log in."
    end
  end

end
