Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/" => 'home#top'

  root  'items#index'  #この1行を追加
  resources :items, only: [:new, :create, :edit, :update]
end
