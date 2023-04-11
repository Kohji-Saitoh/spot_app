Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
  
  resources :spots
  root 'spots#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get  '/users' => redirect('/')

  resources :spots do               #こちらの２行を追加
    resource :likes, only: [:create, :destroy]
  end

  resources :spots do               #こちらの２行を追加
    resource :comments, only: [:create]
  end
end
