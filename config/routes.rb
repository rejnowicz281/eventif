Rails.application.routes.draw do
  devise_for :users
  get "/events", to: "events#index"
  get "/events/new", to: "events#new", as: "new_event"
  get "/events/:id", to: "events#show", as: "event"
  post "/events", to: "events#create"
  get "/events/:id/edit", to: "events#edit", as: "edit_event"
  put "/events/:id", to: "events#update"
  delete "/events/:id", to: "events#destroy", as: "destroy_event"

  root "events#index"
end
