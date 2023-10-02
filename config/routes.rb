Rails.application.routes.draw do
  devise_for :users
  get "/events", to: "events#index"
  get "/events/new", to: "events#new", as: "new_event"
  get "/events/:id", to: "events#show", as: "event"
  post "/events", to: "events#create"

  root "events#index"
end
