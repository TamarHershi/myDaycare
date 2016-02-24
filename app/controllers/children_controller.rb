class ChildrenController < ApplicationController

  def index
    @user = @current_user
    @children = @user.children
  end

  def show
    @child = Child.find(params[:id])
  end
end
