Rails.application.routes.draw do
  resources :users_forum_posts
  get 'sessions/new'
  root to: 'static#index'


  get    '/feed',    to: 'static#feed'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/repair_offers/:id/follow', to: 'repair_offers#follow'
  get    '/repair_offers/:id/unfollow', to: 'repair_offers#unfollow'

  resources :roles
  resources :repair_offers
  resources :comments
  resources :forum_posts
  resources :users

end
