class CommentsController < ApplicationController
    
    include SessionHelper

    before_action :authenticate_user

    def create
        @gossip = Gossip.find(params[:gossip_id])
        @comments = @gossip.comments.create(comment_params)
        redirect_to gossip_path(@gossip)
    end

   private 

   def comment_params
    params.require(:comment).permit(:content, :gossip_id)
   end

   def authenticate_user
        unless current_user
            redirect_to 'session/new'
        end
   end
end
