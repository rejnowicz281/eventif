Rails.application.routes.draw do
  get "/events", to: "events#index"
  get "/events/:id", to: "events#show", as: "event"

  root "events#index"
end
