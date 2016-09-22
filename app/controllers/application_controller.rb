class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :logged_in?, :admin?

  def logged_in?
  	!!current_user
  end

  def admin?
    return true if current_user.group_id == 1
    return false
  end

  # def require_user
  # 	if !logged_in?
  # 		flash[:danger] = "You must be logged in"
  # 		redirect_to root_path
  # 	end
  # end


end
