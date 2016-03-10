class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:health]

  def index
    if !@parent.nil?
      redirect_to parents_path
    else
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
