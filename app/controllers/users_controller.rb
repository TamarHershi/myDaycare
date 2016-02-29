class UsersController < ApplicationController

  def show
  end

  def my_class
    @user = @current_user
    @children = @user.children
  end

  def attendees
    @user = @current_user
    @children = @user.children
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
