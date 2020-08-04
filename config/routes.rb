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

  post 'wish_check_create/:id' => 'wish_checks#create' ,as: "wish_check_create"
  delete 'wish_check_destroy/:id' => 'wish_checks#destroy' , as: "wish_check_delete"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
