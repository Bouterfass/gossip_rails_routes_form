Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gossips do
    resources :comments
  end

  resources :user, only: :show

  resources :cities, only: :show

 

end
