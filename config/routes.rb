Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :event_attendees, only: [:create]
  end

  resources :users, only: [:show]
  get 'events/index'
  root 'events#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
