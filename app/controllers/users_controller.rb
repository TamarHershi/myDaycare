class UsersController < ApplicationController

  def show
    @user = User.find(params[id])
  end

  def index
    @users = User.all
  end

  def welcome
    email = "misshershi@gmail.com"
    WelcomeMailer.welcome(email).deliver_now
    redirect_to :back
  end

end
