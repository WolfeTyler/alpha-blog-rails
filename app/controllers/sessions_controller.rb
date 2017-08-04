class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Great, you've logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Sorry, check login information and try again"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You've been logged out, bon voyage"
        redirect_to root_path
    end
    
end