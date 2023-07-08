Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/states", to: "states#index"
  get "/states/new", to: "states#new"
  get "/states/:id", to: "states#show"
  get "/states/:id/trails", to: "state_trails#index"
  post "/states", to: "states#create"
  get "/states/:id/edit", to: "states#edit"
  patch "/states/:id", to: "states#update"

  get "/trails", to: "trails#index"
  get "/trails/:id", to: "trails#show"


end
