class RoomsController < ApplicationController

    def show
      @child = Child.new
      @room = Room.find(params[:room_id])
    end

    def index
    end

end
