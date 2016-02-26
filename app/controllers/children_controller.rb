require 'pry'
class ChildrenController < ApplicationController

  def index
    @user = @current_user
    @children = @user.children
  end

  def show
    @child = Child.find(params[:id])
  end

  def send_emails
    user = User.find(params[:user_id])
    @children = user.children
    @children.each do |child|
      info = child.infos.last
      SendInfo.send_info(child.email, child, info).deliver_now
    end
    redirect_to :back
  end

end
