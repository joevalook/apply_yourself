Rails.application.routes.draw do

    get "/", to: "apps#index"

  resources :apps, only: [:index, :show, :new, :create, :edit, :update]

  resources :interviews, only: [:new, :create, :edit, :update]

  #users routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # #session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
