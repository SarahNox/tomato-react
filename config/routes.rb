Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  root 'tomato#home'
  get 'pomodoros/history'
  get 'pomodoros/spoiled'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
 
  resources :users


  post 'users/:id/update_password', to: 'users#update_password', as: "password_update"
  get 'users/:id/edit_password', to: 'users#edit_password', as: 'password_edit'
  
  resources :projects , only: [:new, :create] do |projects|
    resources :tasks, only: [:new, :create] do |tasks|
      resources :pomodoros
  end
end

  resources :password_resets 
end