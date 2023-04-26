Rails.application.routes.draw do
  resources :lyrics
  resources :bookmarks
  resources :users
  resources :languages
  resources :songs
  resources :albums
  resources :artists
  post 'login', to: 'login#login'
  post 'logout', to: 'login#logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
