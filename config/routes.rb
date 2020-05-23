Rails.application.routes.draw do
  get 'comments/new'
  get 'posts/new'
  get 'topics/new'
  get 'sessions/new'
  root 'static_pages#home'
  get '/search', to: 'static_pages#search'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/newpost', to: 'posts#new'
  post '/newpost', to: 'posts#create'
  post '/posts/:id/comment', to: 'comments#create'
  post '/posts/:id/comment/:reply', to: 'comments#create'
  get '/my_posts', to: 'users#my_posts'
  get '/my_comments', to: 'users#my_comments'
  patch '/users/:id/verify', to: 'users#verify'
  resources :users
  resources :posts
  resources :comments
end