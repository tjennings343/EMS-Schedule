module ApplicationHelper

    def current_user
        @current_user ||= Captain.find_by(id: session[:captain_id]) if session[:captain_id]
    end

    def logged_in?
        !!current_user
    end


    def require_login
      unless logged_in?
        redirect_to '/'
      end
    end
end
