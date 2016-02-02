Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  root 'tomato#home'
  get 'pomodoros/history'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :pomodoros 
  resources :users
  post 'users/:id/update_password', to: 'users#update_password', as: "password_update"
  get 'users/:id/edit_password', to: 'users#edit_password', as: 'password_edit'
  # post 'users/:id/project', to: 'users#project', as: 'project'
  get 'projects/:id/new', to: 'projects#new', as: 'projects'
  post 'projects/:id/new', to: 'projects#create', as: 'project_create'
  get 'tasks/:id/new', to: 'tasks#new', as: 'tasks'
  post 'tasks/:id/new', to: 'tasks#create', as: 'task_create'
 # get 'pomodoros/:id/title', to: 'pomodoros#title', as: 'tasks'
  # post 'users/:id/task', to: 'users#task', as: 'task'
resources :password_resets #, only: [:new, :create, :edit, :update]

end
