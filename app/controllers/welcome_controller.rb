class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:health]

  def index
    if @current_user.user_type == "p"
      redirect_to parents_path
    elsif @current_user.user_type == "t"
      redirect_to welcome_teacher_path
    end
  end

  def health
    render :nothing => true
  end

  def letsencrypt
    render plain: ENV['LE_AUTH_REQUEST']
  end

end
