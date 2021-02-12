class CaptainsController < ApplicationController

    def index
        @captains = Captain.all
    end

    def new
        @captain = Captain.new
    end

    def show
        @captain = Captain.find_by_id(params[:id])
        @shifts = @captain.shifts
        redirect_to '/' if !@captain
    end

    def create
        @captain = Captain.new(captain_params)
        if @captain.save
            session[:captain_id] = @captain.id
            redirect_to captain_path(@captain)
        else
            render :new
        end
    end

    private

    def captain_params
        params.require(:captain).permit(:name, :email, :password)
    end
end
