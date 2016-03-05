class InfosController < ApplicationController


  def update
    @info = Info.find(params[:id])
    @child = Child.find(@info.child_id)
    @info.assign_attributes(info_params[:info])
    if @info.save
      redirect_to :my_class
    else render :edit
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @info = Info.find(params[:id])
    @date = @info.created_at.strftime('%D')
    @user = @current_user
  end


  def new_forms
    if @current_user.children.last.infos.last.created_at.strftime('%D')!= DateTime.now.strftime('%D')
      room = @current_user.room
      Info.new_infos(room)
      children = @current_user.children
      Child.not_attend(children)
      redirect_to root_path, notice: "Good morning #{@current_user.name}"
    else
      redirect_to root_path, notice: "You already pushed the button"
    end
  end


  private

  def info_params
    params.permit(info: [:diaper_m, :diaper_a, :diaper_n, :breakfast, :lunch, :afternoon, :sleep_time, :general, :more_daiper, :more_wipes, :more_clothes])
  end

end
