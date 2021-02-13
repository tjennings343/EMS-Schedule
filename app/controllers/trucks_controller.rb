class TrucksController < ApplicationController

    def index
        @trucks = Truck.all
    end

    def show
        @truck = Truck.find_by_id(params[:id])
        @shifts = @truck.shifts
    end

    def new
        @truck = Truck.new
    end

    def create
        @truck = Truck.new(truck_params)
        if @truck.save!
            redirect_to truck_path(@truck)
        else
            render :new
        end
    end

    def destroy
        @truck = Truck.find(params[:id])
        @truck.destroy
        redirect_to trucks_path
    end


    private

    def truck_params
        params.require(:truck).permit(:unit_number)
    end
end
