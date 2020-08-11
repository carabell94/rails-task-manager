Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tasks', to: 'tasks#index' # this is how we list all tasks
  get 'tasks/new', to: 'tasks#new' # this is step 1 of creating a task (displaying the task form)
  get 'tasks/:id', to: 'tasks#show', as: 'task' # this is how we list one task
  post 'tasks', to: 'tasks#create' # this is step 2 of creating / adding a task
  # i.e. (handling the post request generated from submitting the form)
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'tasks_edit' # step 1 of update method - getting the form
  patch 'tasks/:id', to: 'tasks#update', as: 'tasks_update' # step 2 of update method - patching the form
  delete 'tasks/:id', to: 'tasks#destroy' # delete an individual task
end
