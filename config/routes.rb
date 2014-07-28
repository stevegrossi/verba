Rails.application.routes.draw do
  root "pages#writing"

  get "/profile" => "pages#profile", as: :profile
  get "/archive" => "pages#archive", as: :archive

  post "/create_post" => "posts#create", as: :create_post
  post  "/update_post" => "posts#update", as: :update_post

  get "/new_prompt" => "pages#new_prompt"

  get "login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  post "/logout" => "sessions#destroy", as: :logout
end
