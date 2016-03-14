class ParentsController < ApplicationController

  def index
    @user = @current_user
    @parent = Parent.find_by(email: @user.email)
    # @parent = Parent.create(name: "new parent") if @parent.nil?
    # find the parent
  end

  def my_children
    @parent = Parent.find(params[:id])
    @children = @parent.children
  end

  def my_child_info
    @parent = Parent.find(params[:parent_id])
    @child = Child.find(params[:id])
    @infos = @child.infos
  end

  def pay_tuition
    @parent = Parent.find(params[:id])
    @children = @parent.children
    month = DateTime.now.strftime('%m')
    @months = {"01" => "January", "02" => "February", "03" => "March", "04" => "April", "05" => "May"}
    @current_month = @months[month]
    @current_year = DateTime.now.strftime('%Y')
  end


end
