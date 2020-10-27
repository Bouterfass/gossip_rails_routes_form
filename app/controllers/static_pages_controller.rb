class StaticPagesController < ApplicationController
  def home
    @array = Gossip.all.to_a.each_slice(3).to_a
  end

  def contact
  end

  def team
  end

  def welcome 
    @name = params['name']
  end

  def gossip
    @user = User.find_by(id: Gossip.find_by(id: params['id'].to_i).user_id)
    @gossip_content = Gossip.find_by(id: params['id'])
  end

  def user
    @user = User.find_by(id: params['id'].to_i)
    @city = City.find_by(id: @user.city_id.to_i)
  end
end
