class GossipRailsRoutesFormController < ApplicationController
  
  def index

    @array = Gossip.all.to_a.each_slice(3).to_a

  end

  def show

    @user = User.find_by(id: Gossip.find_by(id: params['id'].to_i).user_id)
    @gossip = Gossip.find_by(id: params['id'])

  end

  def new

    @gossip_new = Gossip.new

  end
  
  def create

    @user_new = User.new(first_name: params['author'])
    @user_new.save
    @gossip_new = Gossip.new(title: params['title'],content: params['body'], user: @user_new)
    
    if @gossip_new.save
      redirect_to '/gossip_rails_routes_form'
    else
      render new_gossip_rails_routes_form_path
    end
    
  end

  def edit

    @gossip_update = Gossip.find(params[:id])

  end

  def update

    @gossip_update = Gossip.find(params[:id])
    params_to_update = params.require(:gossip).permit(:title, :content)
    
    if @gossip_update.update(params_to_update)
      redirect_to '/gossip_rails_routes_form'
    else
      render new_gossip_rails_routes_form_path
    end

 

  end

  def destroy

    @gossip = Gossip.find(params['id'])
    @gossip.destroy
    redirect_to '/gossip_rails_routes_form'    

  end
end
