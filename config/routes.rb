Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"


  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  post "/teams", to: "teams#create"
  get "/teams/:id", to: "teams#show"
  get "/teams/:id/players", to: "teams#show_players", as: "team_players"
  get "/teams/:id/edit", to: "teams#edit", as: "edit_team"
  patch "/teams/:id", to: "teams#update", as: "update_team"
  post "/teams/:team_id/players", to: "players#create", as: "team_players_create"
  get "/teams/:id/players/new", to: "players#new", as: "new_team_player"
  post "teams/:id/players/new", to: "players#create", as: "create_team_player"
  delete "/teams/:id", to: "teams#destroy", as: "team_delete"

  get "players/:id/edit", to: "players#edit", as: "edit_player"
  patch "/players/:id", to: "players#update", as: "update_player"
  get "players/:id", to: "players#show"
  get "/players", to: "players#index"
  delete "/players/:id", to: "players#destroy", as: "player_delete"
end
