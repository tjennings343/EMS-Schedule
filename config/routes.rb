Rails.application.routes.draw do
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'captains#new'

  
  resources :trucks
  resources :shifts
  resources :captains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
