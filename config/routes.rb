Rails.application.routes.draw do

  root 'access#index'



  resources :games
  resources :game_sessions
  resource :users

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
