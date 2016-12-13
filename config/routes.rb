Rails.application.routes.draw do

  root 'access#index'

  resources :game_session_players
  resources :player_awards
  resources :awards
  resources :player_histories
  resources :game_sessions
  resources :players
  resources :games

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
