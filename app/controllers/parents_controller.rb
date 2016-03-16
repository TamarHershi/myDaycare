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

  def edit
    @parent = Parent.find(params[:id])
    @child = Child.find(params[:child_id])

  end

  def update
    @parent = Parent.find(params[:id])
    @child = Child.find(params[:child_id])
    if @parent.update(parent_params)
      redirect_to my_child_info(@parent.id, @child.id)
    else
      render :edit
    end
  end

  def pay_tuition
    @parent = Parent.find(params[:id])
    @children = @parent.children
    month = DateTime.now.strftime('%m')
    @months = {"01" => "January", "02" => "February", "03" => "March", "04" => "April", "05" => "May"}
    @current_month = @months[month]
    @current_year = DateTime.now.strftime('%Y')
  end

  private

    def parent_params
      params.require(:parent).permit(:name, :email, :phone_number1, :last_name, :address)
    end


end
