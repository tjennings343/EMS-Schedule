module ApplicationHelper

    def current_user
        @current_user ||= Captain.find_by(id: session[:captain_id]) if session[:captain_id]
    end

    def logged_in?
        !!current_user
    end


  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/'
    end
  end
end
