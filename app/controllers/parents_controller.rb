class ParentsController < ApplicationController

  def index
    @user = @current_user
    @parent = Parent.find_by(email: @user.email)
    # find the parent
  end

  def my_children
    @parent = Parent.find(params[:id])
    @children = @parent.children
  end

end
