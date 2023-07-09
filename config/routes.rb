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
  patch "/teams/:id", to: "teams#update"
  
  get "/players", to: "players#index"
  get "players/:id", to: "players#show"
end
