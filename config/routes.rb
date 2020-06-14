Rails.application.routes.draw do
  get 'logs/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  resources :events

  resources :logs
  resources :wishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
