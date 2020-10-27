Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gossip_rails_routes_form

  resources :user, only: :show

end
