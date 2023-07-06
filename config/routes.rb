Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/states", to: "states#index"
  get "/states/:id", to: "states#show"
  get "/states/:id/trails", to: "state_trails#index"

  get "/trails", to: "trails#index"
  get "/trails/:id", to: "trails#show"


end
