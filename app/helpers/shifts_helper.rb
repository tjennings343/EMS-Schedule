module ShiftsHelper

    def truck_id_field(shift)
        if shift.truck.nil?
          select_tag "shift[truck_id]", options_from_collection_for_select(Truck.all, :id, :unit_number)
        else
          hidden_field_tag "shift[truck_id]", shift.truck_id
        end
      end
end


