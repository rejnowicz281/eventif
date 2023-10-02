Rails.application.routes.draw do
  devise_for :users
  get "/events", to: "events#index"
  get "/events/:id", to: "events#show", as: "event"

  root "events#index"
end
