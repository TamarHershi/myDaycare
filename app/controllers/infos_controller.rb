require 'time'
class InfosController < ApplicationController

  def show
  end

  def update
    @child = Child.find(params[:child_id])
    today = DateTime.now
    @info = Info.find_by(created_at: today)
    raise
  end

  def new
  end

  def create
  end

end
