class UsersController < ApplicationController

  def show
  end

  def my_class
    info = @current_user.children.last.infos.last
    if info.created_at.strftime('%D')!= DateTime.now.strftime('%D')
      redirect_to :new_forms
    else
      @user = @current_user
      @children = @user.children
    end

  end

  def welcome_teacher
    @user = @current_user
  end

  def attendees
    @user = @current_user
    @children = @user.children
  end

  def index
    @users = User.all
  end

  # def welcome
  #   email = "misshershi@gmail.com"
  #   WelcomeMailer.welcome(email, @current_user).deliver_now
  #   redirect_to :back
  # end

end
