module SessionsHelper

    def log_in(captain)
        session[:captain_id] = @captain.id  
    end
end