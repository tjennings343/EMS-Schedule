class ShiftsController < ApplicationController


    def index
        if params[:truck_id]
            @shifts = Truck.find(params[:truck_id]).shifts
        else
        @shifts = Shift.all
        end
    end

    def new
        @shift = Shift.new(truck_id: params[:truck_id])
    end

    def show
        @shift = Shift.find_by_id(params[:id])
    end

    def create
        @shift = Shift.new(shift_params)
        @shift.captain_id = session[:captain_id]
        if @shift.save!
            redirect_to shift_path(@shift)
        else
            render :new
        end
    end


    private

    def shift_params
        params.require(:shift).permit(:shift_name, :shift_date, :truck_id, truck_attributes: [:unit_number])
    end
end
