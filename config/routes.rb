Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create]
  post '/signin', to: 'users#signin'
  post '/save-game', to: 'users#save_game'
  post '/createUser', to: 'users#createUser'
end
