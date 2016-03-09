class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :parent
  before_action :require_login
  before_action :current_user


  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
   rescue ActiveRecord::RecordNotFound
  end

  def parent
    if @current_user.user_type == "p"
      @parent = Parent.find_by(email: @current_user.email)
    end
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in"
      redirect_to new_session_path
    end
  end

end
