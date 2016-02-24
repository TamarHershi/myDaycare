class InfosController < ApplicationController

  def show
  end

  def update
    @child = Child.find(params[:child_id])
    @info = @child.infos.last

    @info.update(info_params[:info])
    redirect_to user_children_path(@current_user.id)
  end

  def edit
    @child = Child.find(params[:child_id])
    @info = @child.infos.last
  end


  def new
    room = @current_user.class
    Info.new_infos(room)
    redirect_to user_children_path(@current_user.id)
  end

  def create
  end

  private

  def info_params
    params.permit(info: [:diaper_m])
  end

end
