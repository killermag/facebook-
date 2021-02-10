Rails.application.routes.draw do

  get 'user', to: 'users#me', as: 'current_user'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do 
    root "devise/sessions#new"

  end 
  
  resources :homes, only: [:index]
  resources :posts, except: [:show, :index]
  resources :friends, only: [:index, :new, :create, :destroy]
  get 'likes', to: 'likes#create', as: :likes

end 
