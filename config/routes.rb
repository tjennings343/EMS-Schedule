Rails.application.routes.draw do
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/createaccount' => 'captains#new'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  
  resources :trucks do
    resources :shifts, only: [:new, :show]
  end
  resources :shifts
  resources :captains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
