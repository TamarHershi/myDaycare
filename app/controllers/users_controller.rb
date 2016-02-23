class UsersController < ApplicationController

  def show
    @user = User.find(params[id])
  end

  def index
    @users = User.all
  end

  def welcome
    email = "misstamar@gmail.com"
    WelcomeMailer.welcome(email).deliver
    redirect_to :back
  end

end
