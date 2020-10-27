class UserController < ApplicationController
    def show
        @user = User.find_by(id: params['id'].to_i)
        @city = City.find_by(id: @user.city_id.to_i)
    end
end
