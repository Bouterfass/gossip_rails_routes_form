class SessionController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to '/gossips'
        else
            puts "*" *80
            flash.now[:danger] = "Invalid email or password."
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/gossips'
    end

end
