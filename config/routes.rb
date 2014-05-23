TictactoeIntensive::Application.routes.draw do

  root :to => 'players#index'

  resources :sessions, only: [:new, :create, :destroy]
  
  resources :games

  resources :moves

  resources :players
 
  get 'session/index'
  get '/signup',     to: 'players#new',       as: 'signup'
  get '/login',      to: 'sessions#new',      as: 'login'
  delete '/logout',  to: 'sessions#destroy',  as: 'logout'
  post '/make_move', to: 'games#make_move',   as: 'make_move'
end
