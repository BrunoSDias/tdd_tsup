Rails.application.routes.draw do
  resources :todos, except: :index
  put '/complete_todo/:id', to: 'todos#complete', as: :complete_todo
  resources :user_addresses, except: :index

  get 'home/index'
  get 'sessions/signin'
  get 'sessions/signup'
  post 'sessions/login'
  post 'sessions/create'

  post 'sessions/signout'
end