class UsersController < ApplicationController

  def show
  end

  def my_class
    if check_new_day
      @user = @current_user
      @children = @user.children
    else
      redirect_to root_path, notice: "Please push the 'New Day' button"
      # add flash note
    end
  end

  def check_new_day
    info = @current_user.children.last.infos.last
    if info.created_at.strftime('%D')!= DateTime.now.strftime('%D')
      return false
    else
      return true
    end
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
