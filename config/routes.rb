Rails.application.routes.draw do

  root to: 'home#index'

  get "/directory" => 'home#show'

  resources :games
  
  resources :players, except: [:show]

  resources :teams

  resources :pitches

  get "/" => "players#welcome", as: :welcome

  get "players" => "players#index"
  
  get "players/batters" => "players#batters"

  get "players/matchups" => "players#matchups"

  get "players/pitches_data" => "players#pitches_data"

  get "players/batter_list" => "players#batter_list"

  get "ops_leaders" => "players#ops_leaders"

  get "home_run_leaders" => "players#home_run_leaders"

  get "strikeout_leaders" => "players#strikeout_leaders"

end
