class RoomsController < ApplicationController

    def show
      @user = @current_user
      @room = Room.find(params[:id])
      @children = @room.children
    end

    def index
    end

end
