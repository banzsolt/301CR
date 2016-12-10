Rails.application.routes.draw do

  resources :player_awards
  resources :awards
  resources :player_histories
  resources :game_sessions
  resources :players
  resources :games
  root 'access#index'



  resources :games
  resources :game_sessions
  resource :users

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
