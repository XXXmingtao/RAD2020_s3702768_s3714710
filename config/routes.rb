Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  #root 'session#new'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
