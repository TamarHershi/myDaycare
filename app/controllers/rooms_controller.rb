class RoomsController < ApplicationController

    def show
      @user = @current_user
      @room = Room.find(params[:id])
    end

    def index
    end

end
