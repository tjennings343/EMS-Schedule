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
            redirect_to captain_path(@captain)
        else
            flash[:error] = "Username or Password incorrect."
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    def omniauth
        @captain = Captain.google_omniauth_login(auth)
        session[:captain_id] = @captain.id
        redirect_to captain_path(@captain)  
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
