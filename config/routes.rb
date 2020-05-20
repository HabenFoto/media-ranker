Rails.application.routes.draw do
  resources :works
  root "pages#index"
  resources :users, only: %i[index show new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
