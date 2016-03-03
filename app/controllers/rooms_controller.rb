class RoomsController < ApplicationController

    def show
        @room = Room.find(params[:id])
        @children = @room.children
        Child.not_attend(@children)
        @user = @current_user

    end

  def index
  end

end
