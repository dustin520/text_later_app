class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authenticated?
  	# redirect_to login_url if session[:user_id].nil?
  	redirect_to login_url unless current_user
  end

  def current_user
  	# use 'current user' if available or find the user by it's id.
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def user_name
    @user_name = User.find(session[:user_id])
  end

end
