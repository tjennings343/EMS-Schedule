class ShiftsController < ApplicationController
    before_action :set_shift, only: [:destroy, :update, :show, :edit]
    before_action :redirect_if_not_create, only: [:destroy, :update, :edit]
    before_action :require_login


    def index
        if params[:truck_id]
            @shifts = Truck.find(params[:truck_id]).shifts
        else
        @shifts = Shift.all.ordered_by_date
        end
    end

    def new
        @shift = Shift.new(truck_id: params[:truck_id])
    end

    def show
        @truck = Truck.find_by(params[:truck_id])
    end

    def create
        @shift = Shift.new(shift_params)
        @shift.captain_id = session[:captain_id]
        if @shift.save
            redirect_to shift_path(@shift)
        else
            render :new
        end
    end

    def edit

    end

    def update
        @shift.update(shift_params)
        redirect_to shift_path(@shoe)
    end

    def destroy
        @shift.destroy
        redirect_to shifts_path
    end


    private

    def shift_params
        params.require(:shift).permit(:shift_name, :shift_date, :truck_id, truck_attributes: [:unit_number])
    end

    def set_shift
        @shift = Shift.find(params[:id])
    end

    def redirect_if_not_create
        if @shift.captain != current_user
            redirect_to captain_path(current_user)
        end
    end
end
