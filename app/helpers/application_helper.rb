module ApplicationHelper

    def logged_in?
        !!current_user
    end

    def current_user
        Captain.find_by(id: session[:captain_id])
    end

end
