Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root 'static_pages#home'

  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  get 'welcome/:name', to: 'static_pages#welcome'
  get 'gossip/:id', to: 'static_pages#gossip', as:'gossip'
  get 'user/:id', to: 'static_pages#user', as: 'user'

end
