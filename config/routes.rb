Rails.application.routes.draw do
  root to: 'static_pages#home' 
  get '/club', to: 'static_pages#club', as: 'club'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
