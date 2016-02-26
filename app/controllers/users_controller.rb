class UsersController < ApplicationController

  def show

  end

  def index
    @users = User.all
  end

  def welcome
    email = "misshershi@gmail.com"
    WelcomeMailer.welcome(email, @current_user).deliver_now
    redirect_to :back
  end

end
