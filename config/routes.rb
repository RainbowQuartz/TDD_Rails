Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
