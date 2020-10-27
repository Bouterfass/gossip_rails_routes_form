class GossipRailsRoutesFormController < ApplicationController
  
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @array = Gossip.all.to_a.each_slice(3).to_a
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @user = User.find_by(id: Gossip.find_by(id: params['id'].to_i).user_id)
    @gossip_content = Gossip.find_by(id: params['id'])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
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

    
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
=begin
  def welcome 
    @name = params['name']
  end

  def user
    @user = User.find_by(id: params['id'].to_i)
    @city = City.find_by(id: @user.city_id.to_i)
  end
=end
end
