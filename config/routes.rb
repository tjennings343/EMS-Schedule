Rails.application.routes.draw do
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/createaccount' => 'captains#new'
  delete '/logout' => 'sessions#destroy'

  
  resources :trucks do
    resources :shifts, only: [:new, :index]
  end
  resources :shifts
  resources :captains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
