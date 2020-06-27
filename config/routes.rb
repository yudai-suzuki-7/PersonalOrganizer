Rails.application.routes.draw do
  root :to => 'homes#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  resource :users, only:[:create, :show, :edit, :update]
  resources :events
  resources :logs
  resources :todos
  patch 'todo_check/:id' => 'todos#check' ,as: "todo_check"
  resources :booklogs
  get 'books' => 'books#search'

  get 'home/about' => 'homes#about'

  resources :wishes do
    resource :logictrees
  end
  patch 'wish_check/:id' => 'wishes#check' ,as: "wish_check"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
