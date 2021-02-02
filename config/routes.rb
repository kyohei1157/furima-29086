Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items
end
