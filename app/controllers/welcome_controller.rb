class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:health]

  def index
  end

  def health
    render :nothing => true
  end

end
