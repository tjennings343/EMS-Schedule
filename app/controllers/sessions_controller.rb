class SessionsController < ApplicationController

    def index
    end

    def new
        @captain = Captain.new
    end

    def create
        @captain = Captain.find_by(email: params[:captain][:email])
        if @captain && @captain.authenticate(params[:captain][:password])
            log_in @captain
            byebug
            redirect_to captain_path(@captain)
        else
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

end
