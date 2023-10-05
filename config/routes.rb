Rails.application.routes.draw do
  devise_for :users

  get '/events', to: 'events#index'
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events/:id', to: 'events#show', as: 'event'
  post '/events', to: 'events#create'
  get '/events/:id/edit', to: 'events#edit', as: 'edit_event'
  put '/events/:id', to: 'events#update'
  delete '/events/:id', to: 'events#destroy', as: 'destroy_event'

  patch '/events/:id/end', to: 'events#end', as: 'end_event'
  patch '/events/:id/resume', to: 'events#resume', as: 'resume_event'
  patch '/events/:id/make_private', to: 'events#make_private', as: 'make_event_private'
  patch '/events/:id/make_public', to: 'events#make_public', as: 'make_event_public'

  post '/events/:id/comments', to: 'event_comments#create', as: 'event_comments'
  delete '/event_comments/:id', to: 'event_comments#destroy', as: 'destroy_event_comment'

  post '/events/:id/join', to: 'event_memberships#create', as: 'join_event'
  delete '/events/:id/destroy_membership/:user_id', to: 'event_memberships#destroy', as: 'destroy_event_membership'
  patch '/events/:id/accept_membership/:user_id', to: 'event_memberships#accept', as: 'accept_event_membership'

  root 'events#index'
end
