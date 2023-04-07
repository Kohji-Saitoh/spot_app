Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
  
  root 'spots#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get  '/users' => redirect('/')
end
