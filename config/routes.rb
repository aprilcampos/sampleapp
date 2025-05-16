Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' } 

  get 'angular-items', to: 'portfolios#angular'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :portfolios do
    member do
      patch :sort
    end
  end
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
