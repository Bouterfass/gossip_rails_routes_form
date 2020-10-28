class CitiesController < ApplicationController

    def show
        @city = City.find(params['id'])
        @all_gossips = Gossip.where(user_id: (User.where(city_id: params['id'])).ids)
    end
end
