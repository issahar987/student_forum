Rails.application.routes.draw do
  resources :users_forum_posts
  get 'sessions/new'
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  get    '/repair_offers/:id/follow', to: 'repair_offers#follow'
  get    '/repair_offers/:id/unfollow', to: 'repair_offers#unfollow'

  resources :roles
  resources :repair_offers
  resources :comments
  resources :forum_posts
  resources :users
  resources :repair_offers do
    resources :topics, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :posts, only: [:new, :create, :edit, :update, :show, :destroy]
    end
  end

end
