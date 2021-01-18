Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/" => 'home#top'

  root  'users#index'  #この1行を追加
  resources :messages, only: [:new, :create, :edit, :update]
end
