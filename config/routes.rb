Rails.application.routes.draw do

    get "/", to: "apps#index"

  resources :companies, only: [:index, :new, :create, :edit, :update] do
    resources :apps, only: [:new, :create] 
  end

  resources :apps, only: [] do
    resources :interviews, only: [:new, :create]
  end

  resources :interviews, only: [:edit, :update]
  resources :apps, only: [:index, :show, :edit, :update]

  #users routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # #session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
