Rails.application.routes.draw do

  get 'user', to: 'users#me', as: 'current_user'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do 
    root "devise/sessions#new"

  end 
  
  resources :homes, only: :index
  

end 
