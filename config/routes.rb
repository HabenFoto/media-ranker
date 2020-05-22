Rails.application.routes.draw do
  resources :works
  root "pages#index"
  resources :users, only: %i[index show new create]
 

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"
  post "/works/:id/upvote", to: "works#upvote", as: "upvote"
  
end
