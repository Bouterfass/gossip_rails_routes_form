class UserController < ApplicationController
    
    
    def new
        @city = City.new
        @user = User.new
    end
    
    def create
        
        if @check = City.find_by(name: params[:city], zip_code: params[:zip_code])
            @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], age: params[:age], city: @check, description: params[:description])
        else
            @city = City.create(name: params[:city], zip_code: params[:zip_code])
            @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], age: params[:age], city: @city, description: params[:description])
        end

        if @user.save
            redirect_to "/session/new"
        else 
            render new_user_path
        end

    end
    
    def show
        @user = User.find_by(id: params['id'].to_i)
        @city = City.find_by(id: @user.city_id.to_i)
    end
end
