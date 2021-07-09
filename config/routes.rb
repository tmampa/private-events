Rails.application.routes.draw do
  devise_for :users
  resources :events
  root 'events#index'
  get '/users', to: 'users#show'
  resources :attended_events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
