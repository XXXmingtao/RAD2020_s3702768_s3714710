Rails.application.routes.draw do
  get 'users/new'
  #root 'session#new'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
