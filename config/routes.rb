Rails.application.routes.draw do

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users, only: [:show]

  resources :spots

  root 'spots#index'

  get  '/users' => redirect('/')

  resources :spots do
    resource :likes, only: [:create, :destroy]
  end

  resources :spots do
    resource :comments, only: [:create]
  end

  resources :comments, only: [:destroy]
end
