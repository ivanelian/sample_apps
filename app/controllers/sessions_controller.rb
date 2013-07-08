class SessionsController < ApplicationController
    def new    
    end
    def create
        #user = User.find_by_email(params[:session][:email].downcase)
        # If you're using form_for in signin form, use the commented syntax above
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #session[:user] = user.id
            sign_in user
            redirect_back_or user
        else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
        end
    end
    def destroy
        sign_out
        redirect_to root_url
    end
end
